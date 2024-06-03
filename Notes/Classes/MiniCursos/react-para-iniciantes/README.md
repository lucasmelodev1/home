# React + TailwindCSS

## Mercado de Trabalho
-- todo
## [Criando Projeto](https://react.dev/learn/start-a-new-react-project)

```bash
npx create-next-app@latest
```

- npx
- create-next-app ([porque não create-react-app](https://react.dev/learn/start-a-new-react-project#can-i-use-react-without-a-framework)) (porque nextjs?)
- latest

```bash
? What is your project named? › todo-app
? Would you like to use TypeScript? › Yes
? Would you like to use ESLint? › Yes
? Would you like to use Tailwind CSS? › Yes
? Would you like to use `src/` directory? › Yes
? Would you like to use App Router? (recommended) › Yes
? Would you like to customize the default import alias (@/*)? › No
```

### Porquê das tecnologias usadas?

#### Typescript

#### ESLint

#### Tailwind CSS

#### App Router

## Entendendo Árvore de Arquivos

### node_modules

### public

### src/app ([App Directory](https://nextjs.org/docs/app))

## Setup Inicial

### Limpar estilos e página padrão do NextJS

1. Deletar pagina inicial do Nextjs
- src/app/page.tsx

```ts

// 'use client' é uma propriedade do NextJS que altera o estilo de renderização da página
// para cliente. Por padrão a renderização é feita pelo servidor, aumentando a velocidade
// inicial, mas impedindo a interatividade da página.

'use client'

export default function Home() {
  return (
    <div></div>
  )
}
```

2. Deletar dark mode por padrão
```css
/* src/app/layout.tsx */

@tailwind base;
@tailwind components;
@tailwind utilities;
```

## Componentes

### Criando primeiro componente

TODO: explicar funcao e retorno de jsx

- src/app/page.tsx

```ts

function AddTodoInput() {
  return (
    <input placeholder="Arrumar a casa"/>
  )
}
```
<br>

TODO: explicar ele ainda nao apareceu na tela

- src/app/page.tsx

```ts

export default function Home() {
  return (
    <div>
      {/* Adicionamos o nome da função dentro de uma tag jsx (ex. </>) */}
      <AddTodoInput/>
    </div>
  );
}
```

### Criando propriedades

- src/app/page.tsx

```ts

function AddTodoButton() {
  return (
    <button>Adicionar</button>
  )
}
```
<br>

- src/app/page.tsx

```ts
// Propriedades são criadas dentro do argumento `props`
function AddTodoButton(props: {onClick: () => void}) {
  return (
    {/* onClick está sendo passado como ponteiro, não sendo invocado */}
    <button onClick={onClick}>Adicionar</button>
  )
}
```
<br>

- src/app/page.tsx

```ts

export default function Home() {
  return (
    <div>
      <AddTodoInput/>
      <AddTodoButton onClick={() => alert("botão clicado")} />
    </div>
  );
}
```

### Modularização

#### Criando pasta Components
```
todo-app
└───src
│   └──app
│   └──components
│   │   add-todo-input.tsx
│   │   add-todo-button.tsx
```

#### Criando componentes

1. AddTodoInput

-  src/components/add-todo-input.tsx
```ts

// TODO: explicar export default
export default function AddTodoInput(props: { onChange: (text: string) => void }) {
  return (
    <input placeholder="Arrumar a casa" onChange={(e) => props.onChange(e.target.value)} />
  )
}
```
<br>

2. AddTodoButton

- src/components/add-todo-button.tsx

```ts

export default function AddTodoButton(props: { onClick: () => void }) {
  return (
    <button onClick={props.onClick}>Adicionar</button>
  )
}
```
<br>

3. Atualizar page.tsx

- src/app/page.tsx

```ts
import AddTodoInput from '@/components/add-todo-input'
import AddTodoButton from '@/components/add-todo-button'
```

### Reatividade
-- todo explicar o que é reatividade

-- explicar o que é hooks

#### Vincular valor do `<input/>` a uma variável

```ts
// TODO: explicar use state
const [todoName, setTodoName] = React.useState<string>('');
```

- src/components/add-todo-input.tsx

```ts
function AddTodoInput(props: {onChange: (text: string) => void}) {
  return (
    <input placeholder="Arrumar a casa" onChange={(e) => props.onChange(e.target.value)}/>
  )
}
```
<br>

- src/app/page.tsx

```ts
export default function Home() {
  const [todoName, setTodoName] = React.useState<string>('');

  return (
    <div>
      {/* passamos `setTodoName` pra ser chamado toda vez que o input mudar o valor */}
      <AddTodoInput onChange={setTodoName}/>
      {/* damos alert() no `todoName` para debugar o useState*/}
      <AddTodoButton onClick={() => alert(todoName)}/>
    </div>
  );
}
```
<br>

#### Criando TodoItem

- src/components/todo-item.tsx

```ts
export default function TodoItem(props: {
  done: boolean;
  name: string;
}) {
  return (
    <div>
      <input type="checkbox" />
      <p>{props.name}</p>
    </div>
  )
}
```
<br>

```ts
// para testar o componente, podemos colocar essa linha no page.tsx
<TodoItem done={false} name={"test"} />
```

TODO: mencionar que ta funcionando mas ta feio, por isso usar tailwind

<br>

##### Tailwind
-- TODO: explicar o que é tailwind
-- TODO: explicar que eles podem estilizar como quiserem

-  src/components/add-todo-input.tsx
```ts
<div
  className={
    `flex items-center gap-2 p-3 border rounded-md `
  }
>
  <input type="checkbox" className="h-4 w-4" />
  <p className="text-md">{props.name}</p>
</div>
```
<br>

-  src/components/add-todo-input.tsx

```ts
<input
  className="px-4 py-2 border rounded-md w-full"
  placeholder="Arrumar a casa"
  onChange={(e) => props.onChange(e.target.value)}
/>
```
<br>

- src/components/add-todo-button.tsx

```ts
<button
  className="bg-green-500 px-4 py-2 rounded-md text-white"
  onClick={props.onClick}
>
  Adicionar
</button>
```
<br>

- src/app/page.tsx

```ts
<div className="flex flex-col gap-4 p-12 border rounded-lg w-full max-w-[600px]">
  <div className="flex gap-4">
    <AddTodoInput onChange={setTodoName} />
    <AddTodoButton onClick={() => alert(todoName)} />
  </div>
  <div className="flex flex-col gap-2">
    <TodoItem done={false} name={"test"} />
  </div>
</div>
```

<br>

#### Adicionar TodoItem
TODO: explicar padrao de usar pasta models para tipos, interfaces, classes etc.

```
todo-app
└───src
│   └──app
│   └──components
│   └──models
│   │   todo.ts
```
<br>

- src/models/todo.ts

```ts
export default interface Todo {
  // TODO: porque usar id (key)
  id: string;
  done: boolean;
  name: string;
}
```
<br>

- src/app/page.tsx

```ts
'use client'

import React from 'react'
import AddTodoInput from '@/components/add-todo-input'
import AddTodoButton from '@/components/add-todo-button'
import TodoItem from '@/components/todo-item';
import Todo from '@/models/todo';

export default function Home() {
  const [todos, setTodos] = React.useState<Todo[]>([]);
  const [todo, setTodo] = React.useState<Todo>({
    id: crypto.randomUUID(),
    done: false,
    name: ''
  });

  return (
    <div className="flex flex-col gap-4 p-12 border rounded-lg w-full max-w-[600px]">
      <div className="flex gap-4">
        <AddTodoInput onChange={(name) => setTodo({
          ...todo,
          name: name,
        })} />
        <AddTodoButton onClick={() => {
          setTodos([
            ...todos,
            todo,
          ])

          setTodo({
            id: crypto.randomUUID(),
            done: false,
            name: '',
          })
        }} />
      </div>
      <div className="flex flex-col gap-2">
        {todos.map((todo) => (
          <TodoItem
            key={todo.id}
            done={todo.done}
            name={todo.name}
            onChecked={() => setTodos(todos.map((innerTodo) => {
              if (innerTodo.id != todo.id) {
                return innerTodo
              }
              return {
                ...innerTodo,
                done: !innerTodo.done,
              }
            }))}
          />
        ))}
      </div>
    </div>
  );
}
```
<br>

- src/components/todo-item.tsx

```tsx
export default function TodoItem(props: {
  done: boolean;
  name: string;
  onChecked: () => void;
}) {
  return (
    <div
      className={
        `flex items-center gap-2 p-3 border rounded-md ` +
        `${props.done ? "bg-green-400 line-through" : ""}`
      }
    >
      {props.done ? "true" : "false"}
      <input type="checkbox" className="h-4 w-4" onChange={props.onChecked} />
      <p className="text-md">{props.name}</p>
    </div>
  )
}
```
