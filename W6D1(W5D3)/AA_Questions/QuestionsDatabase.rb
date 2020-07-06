require 'sqlite3'
require 'singleton'

class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question
  attr_accessor :title, :body, :author_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    questions = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless questions.length > 0

    Question.new(questions.first)
  end

  def self.find_by_author_id(author_id)
    questions = QuestionDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    questions.map { |question| Question.new(question) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    author_id
  end

  def replies
    Reply.find_by_question_id(@id)
  end
end

class User
  attr_accessor :fname, :lname

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_name(fname, lname)
    users = QuestionDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ? 
    SQL

    users.map { |user| User.new(user) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Replies.find_by_user_id(@id)
  end
end

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.followers_for_question_id(question_id)
    question_follows = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON user_id = users.id
    SQL
  end

  def self.followed_questions_for_user_id(user_id)
    question_follows = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON user_id = users.id
    SQL
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

class Replies
  attr_accessor :body, :question_id, :parent_reply_id, :user_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Replies.new(datum) }
  end

  def self.find_by_user_id(user_id)
    replies = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless replies.length > 0

    Replies.new(replies.first)
  end

  def self.find_by_question_id(question_id)
    replies = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    replies.map { |reply| Replies.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @user_id = options['user_id']
  end

  def author
    user_id
  end

  def question
    body
  end

  def parent_reply
    replies = QuestionDBConnection.instance.execute(<<-SQL, parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    replies.map { |reply| Replies.new(reply) }
  end

  def child_replies
    replies = QuestionDBConnection.instance.execute(<<-SQL, parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    replies.map { |reply| Replies.new(reply) }
  end

end

class Question_Likes
  attr_accessor :question_id, :user_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM question_likes")
    data.map { |datum| Question_Likes.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end

