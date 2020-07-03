def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select(:id, :title, :yr, :score)
    .where(yr: (1980..1989), score: (3..5))
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
    .group("yr")
    .having("MAX(score) < 8")
    .pluck(:yr)

    # good_years = Movie.where("score > 8").pluck(:yr) 
    # Movie
    #   .where.not(yr: good_years).distinct.pluck(:yr)

end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Movie
    .select("actors.id, actors.name")
    .joins(:actors)
    .where(movies: { title: title })
    .order("castings.ord ASC")
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  # Movie
  #   .select(:id, :title, "actors.name")
  #   .joins(:director, :castings)
  #   .where("castings.ord = 1")

  Actor
      .select("movies.id, movies.title, actors.name")
      .joins(:directed_movies, :castings)
      .where("castings.ord = 1 AND movies.director_id IS NOT NULL")
      .group("movies.id")



end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

  Actor
    .select("actors.id, actors.name, COUNT(movies.title) AS roles")
    .joins(:movies)
    .where("castings.ord != 1")
    .group("actors.id")
    .order("roles DESC")
    .limit(2)

end


      #  expected collection contained:  [{"id"=>16, "name"=>"Gene Hackman", "roles"=>20}, {"id"=>44, "name"=>"Robert Duvall", "roles"=>20}]
      #  actual collection contained:    [{"id"=>44, "name"=>"Robert Duvall", "num_supporting_roles"=>20}, {"id"=>16, "name"=>"Gene Hackman", "num_supporting_roles"=>20}]
      #  the missing elements were:      [{"id"=>16, "name"=>"Gene Hackman", "roles"=>20}, {"id"=>44, "name"=>"Robert Duvall", "roles"=>20}]
      #  the extra elements were:        [{"id"=>44, "name"=>"Robert Duvall", "num_supporting_roles"=>20}, {"id"=>16, "name"=>"Gene Hackman", "num_supporting_roles"=>20}]