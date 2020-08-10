export const RECEIVETODOS = "RECEIVETODOS";
export const RECEIVETODO = "RECEIVETODO";


export function receiveTodos(todos) {
  return (
    {
      type: RECEIVETODOS,
      todos
    }
  )
}

export function receiveTodo(todo) {
  return (
    {
      type: RECEIVETODO,
      todo
    }
  )
}
