{/* <div class="todo-container">
  <h2>Todo List</h2>
  <p></p>
  <ul class="todos">
    <li>Add some Todos!</li>
  </ul>
  <form class="add-todo-form">
    <input type="text" name="add-todo" placeholder="What do you have Todo Today?" required>
      <input type="submit" value="+ Add Todo">
      </form> 
    </div> */}

const todos = [];
const todoList = document.querySelector(".todos");
const todoForm = document.querySelector(".add-todo-form");

const addTodo = function(event) {
    event.preventDefault();
    const input = document.querySelector("input[name='add-todo']");
    const inputValue = input.value;
    const todoItem = {
      value: inputValue,
      done: false
    };
    todos.push(todoItem);
    input.value = "";
    populateList(todos);
}

const populateList = function(todos) {
  let todoList = document.querySelector(".todos");

  todos.map((todo) => {
    let label = document.createElement("label");
    let input = document.createElement("input");
    label.setAttribute('for', 'cb');
    input.id = 'cb';
    input.type = 'checkbox';
    label.appendChild(todo);
    let li = document.createElement("li");
    li.appendChild(label);
    todoList.appendChild(li);
  });
};

const checkbox = function() {

}

todoForm.addEventListener("submit", addTodo);
todoList.addEventListener("mouseclick", checkbox);