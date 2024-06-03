# Desenvolvimento de aplicações de terminal em Rust

## O que é Rust
- Linguagem de Programação
- Controle Baixo Nível
- Abstrações de Alto Nível
- Velocidade igual a C e C++
- Gerenciamento de Pacotes com Cargo
- Imenso ecossistema de bibliotecas

## Onde Rust é mais usado
- Sistemas Embarcados
- Aplicações de Alta performance
- Aplicações que requerem segurança de memória
- CLI (Command Line Interfaces)
- Servidores Web
- Aplicações Desktop
- Aplicações Crossplatform
- Entre outros...

## Quem está usando Rust hoje
### [Fundadores da Rust Foundation](https://sdtimes.com/softwaredev/rust-foundation-launches-with-founding-members-mozilla-google-microsoft-and-more/)
### Alguns exemplos de quem está usando Rust
- Microsoft
> [Microsoft is busy rewriting core Windows code in memory-safe Rust](https://www.theregister.com/2023/04/27/microsoft_windows_rust/)
> [Chefe de tecnologia da Microsoft pede fim do uso de C e C++ em novos projetos](https://x.com/markrussinovich/status/1572619885083230208)
- Google
> [Google Contributes $1M to Rust Foundation to Support C++/Rust “Interop Initiative”](https://tugatech.com.pt/t58548-google-doa-um-milhao-de-dolares-para-a-rust-foundation)
> [Rust developers at Google are twice as productive as C++ teams](https://www.theregister.com/2024/03/31/rust_google_c/)
- Amazon
> [Amazon explica por que usa a linguagem de programação Rust em seus projetos](https://canaltech.com.br/mercado/amazon-explica-por-que-usa-a-linguagem-de-programacao-rust-em-seus-projetos-210025/)
- Vercel (empresa por trás do maior framework React, Nextjs)
> [How Turborepo is porting from Go to Rust](https://vercel.com/blog/how-turborepo-is-porting-from-go-to-rust)
- Cloudflare, Dropbox, Mozilla, Atlassian, 1Password, Figma, Canonical, npm Inc, entre outras.

## Características de Rust
- Não é orientada a objetos, mas deriva muitas funcionalidades dela
- Multithread
- Tipagem Estática
- Não existe tipo nulo
- Não tem Garbage Collector
- Borrow Checker

## Aprendendo Rust

### Variáveis

```rust
let a = "Hello World";

let b: i32 = 10;

let c: Vec<f64>;
c = vec![1.6, 4.4];
```

### Funções
```rust
// O retorno das funções é definido com `->` após a lista de parâmetros
fn sum(a: i32, b: i32) -> i32 {
  return a + b;
}

fn multiply(a: f32, b: f32) -> f32 {
  // a keyword `return` é opcional num bloco, mas para isso não se usa `;` no final da declaração
  a * b
}

// Funções começam com a keyword `fn`
fn main() {
    println!("{}", sum(2, 7)); // Imprime 9 no terminal
    println!("{}", multiply(15.4, 43.5)) // Imprime 669.89996 no terminal
}
```

### Blocos
```rust
// Blocos retornam valores
let num = {
  let a = 1;
  let b = 2;
  a + b
} // `num` = 3
```

### Condicionais
```rust
fn is_math_right() -> bool {
  let condition = 10 > 5;

  // `if` não usa parênteses
  if condition {
    true
  } else {
    false
  }
}

fn get_lottery_prize(number: i32) -> i32 {
  // Rust não possui `switch` case. No lugar do switch, temos o `match`.
  match number {
    // Se `number` == `4328`, retorne 10 milhões
    4328 => 10_000_000,
    1234 => 25_000,
    2222 => 2_000,
    // `_` é o equivalente a todas as outras opções, assim como o `default` em switch-cases
    _ => 0,
  }
}
```

### Modularização
```rust
// std é uma Crate
// cmp é um módulo de std
// min é uma função de cmp
let least = std::cmp::min(3,8);

// Para encurtar a declaração, use `use`
use std::cmp::min;
let least = min(3,8);
```

### Structs
```rust
// Tipo composto com nome e peso
struct Person {
  name: String,
  weight: f32,
}

let josias = Person { name: String::from("Josias"), weight: 74.5 };
```

```rust
// Implementa função `speak` na struct `Person`.
impl Person {
  fn new_nameless(weight: f32) -> Person {
    Person {
      name: String::from(""),
      // Como o parâmetro `weight` e o campo `weight` tem o mesmo nome,
      // podemos escrever `weight` ao contrário de `weight: weight`.
      weight,
    }
  }

  // Se a função possui parâmetro `self` (equivalente a `this`), ela só
  // pode ser chamada com uma struct instanciada.
  fn speak(self) {
    println!("My name is {} and I weight {} kilos", self.name, self.weight);
  }
}

let nameless = Person::new_nameless(67.4);

let josias = Person { name: String::from("Josias"), weight: 74.5 };
josias.speak(); // Imprime 'My name is josias and I weight 75.5 kilos'
```

```rust
let josias = Person { name: String::from("Josias"), weight: 74.5 };
josias.weight = 44.1 // ERRO: variáveis em Rust não são mutáveis por padrão

// `mut` torna uma variável mutável
let mut cleber = Person { name: String::from("Cleber"), weight: 81.2 };
cleber.weight = 122.1 // SUCESSO
```

### Enums
```rust
enum Vehicle {
    // Variante `Feet` não tem parâmetros
    Feet,
    // Variante `Motorcycle` tem um parâmetro `String`
    Motorcycle(String),
    // Variante `Car` tem dois parâmetros nomeados
    // `passengers` de tipo i32 e
    // `brand` de tipo String
    Car { passengers: i32, brand: String },
}
```

### Nulo?

```rust
// Option é um Enum que possui um Some se existir um valor e None se não existir
fn get_girlfriend_name(height: f32) -> Option<String> {
  if height > 1.80 {
    // `Some` indica que estamos retornando um valor
    Some(String::from("Jéssica"))
  } else {
    // `None` indica que não temos valor
    None
  }
}
```

### Erros
```rust
fn division(a: i32, b: i32) -> Result<i32, ()> {
  if a == 0 || b == 0 {
    Err(())
  } else {
    Ok(a / b)
  }
}

let result = division(1, 2);
// `unwrap`: Se a função retornar um `Err`, pare a execução do programa.
// Caso contrário, retorne o valor esperado.
let value = result.unwrap(); 
```

## Construindo
