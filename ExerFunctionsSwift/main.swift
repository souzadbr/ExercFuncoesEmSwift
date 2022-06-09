//
//  main.swift
//  ExerFunctionsSwift
//
//  Created by Debora.souza on 08/06/22.
//

import Foundation

print("Hello, World!")

//Funções (parte1)

// Sintaxe base de um funcao
/*
func nome(parametro: Tipo) -> TipoDeRetorno {
    Códigos e comandos
    
    return TipoDeRetorno
}
*/

//funcao sem parametro e sem retorno de valor - ela retorna tipo void
func sayHello() {
    print("Hello")
}
sayHello()

//funcao que aceita paramentro
func say(message: String) {
    print(message)
}
say(message: "Bom dia")

//funcao com mais de um paramentro

//func say (message: String, to: String) {
//    print(message, to)
//}
//say(message: "Olá", to: "Debora")


//Funcao que tem retorno de mensagem
//message dentro da funcao se chama parametro
func say (message: String, to: String) -> String {
    return message + " " + to
}
//message fora da funcao o nome é argumento
let sentece = say(message: "Boa noite", to: "Carol")
print(sentece)

////dessa forma quando eu chamo a funcao aparece os argumentos a serem colocados a e b
//
//func sum(a: Int, b:Int) -> Int {
//    return a + b
//}
//print(sum(a: 10, b: 20))

//dessa outra colocando _ os argumentos nao aparecem como se eles não existissem e ao colocar o argumento fica apenas o argumento.

func sum(_ a: Int, _ b:Int) -> Int {
    return a + b
}
print(sum(10, 30))

//posso ter quantos paramentros eu quiser e se eu coloco dois nomes para um paramentro ummfica como interno e outro como externo.
//func multiply ( _ number1: Int, by number2: Int) -> Int {
//    return number1 * number2
//}
//print(multiply(10, by: 20))

      
//exemplo de funcao que aceita varios numeros num unico paramentro como fosse um range que vira uma expecie de array
      func sum(_ initialValue: Int, withValues values: Int...) -> Int {
        var result = initialValue
          for value in values {
              result += value
          }
          return result
      }

     print(sum(10, withValues: 2, 1, 4, 5))


//funcao com retorno de mais de um tipo usando tuplas

let studentData = "Eric Alves Brito:39"

func getStudentInfo(_ data: String) -> (name: String, age: Int) { //retorna uma tupla
    let info = data.components(separatedBy: ":")
    let studentName = info[0]
    let studentAge = Int(info[1])
    return (studentName,studentAge!)
}

let student = getStudentInfo(studentData)
print(student.name)
print(student.age)


//Funções (parte2)

//First Class Citizen??-  literal seria cidaão de primeira classe
//em programacao a gente fala que o objeto é first class citizen quando ele suporta todos os tipos basicos de operacoes
//isso significa que ele pode ser passado como argumento de uma funcao, ele poode ser retornado por uma funcao, ele pode ser modificado, pode ser atribuido a uma variavel. tudo isso é possivel com int, string, doable..
//mas sera que eu posso passar uma funcao como argumento de outra funcao? Sera que eu posso retornar uma funcao a partir de outra funcao? ou atribuir uma funcao a uma variavel. bom, em swift iss é possivel.
//por isso que funcoes em swift são First Class Citizen

func sum1( _ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract( _ a: Int, _ b: Int) -> Int {
    return a - b
}

func divide( _ a: Int, _ b: Int) -> Int {
    return a / b
}

func multiply( _ a: Int, _ b: Int) -> Int {
    return a * b
}
typealias Op = (Int, Int) -> Int //isso é usado para dar apelidos para tipos.

//o tipo da minha funcao usada no paramentro é a funcao sem os nomes dos paramentros ( _ a: Int, _ b: Int) -> Int é igual a (Int, Int) -> Int : aqui temos uma funcao que aceita outra como parametro
func applyOperation( _ a: Int, _ b: Int, operation: Op ) -> Int {
   return operation(a, b)
}

let result = applyOperation(4, 2, operation: sum)
print(result)

//evoluir para uma funcao que retorna outra como parametro

func getOperation( _ operation: String) -> Op {
    switch operation {
        case "soma":
            return sum
        case "subtracao":
            return subtract
        case "divisão":
            return divide
        default:
            return multiply
        }
}

var operation = getOperation("soma")
//operation(2, 2)

//Closures

//são um recurso poderoso da linguagem em swift usadas intensivamente na linguagem
//é um pedaco auto contido de código e funcionalidade que podem ser repassados e utilizados em seu codigo
//closures sao funcoes anonimas que nao possuem nome ...
//utiliza as closures diretamente ..ela existe em outras linguagens e se chama lambda por exemplo.


//sintaxe de uma closure e de uma funcao

//funcao

/*
 func nome(paramentro: tipoDoParamentro) -> TipoDeRetornoDaFuncao {
            bloco de codigo
            ...
            return TipoDeRetornoDaFuncao
 */

//closure

/*
 { (parametro: String) -> String in
        bloco de codigo
        ...
        return String
 }
 */

//a closure nao contem nome o paramentro fica dentro da chave e nas closures usamos a palavra reservada in para definir o inicio do bloco de codigo

func sum2(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func substract2(_ a: Int, _ b: Int) -> Int {
    return a - b
}

//func calculate (_ a: Int, _ b: Int, operation: (Int, Int) -> Int)-> Int {
//    return operation(a, b)
//}
////calculate(10, 20, operation: sum2)


//calculate(10, 20, operation: {(a: Int, b: Int) -> Int in
//    return a*b
//
//})

//calculate(10, 20, operation: {(a, b) -> Int in
//    return a*b
//
//})
//Simplificando, se eu seu que ela devolve um inteiro nao preciso colocar os tipos de a e de b

//calculate(10, 20, operation:{ a, b in
//    return a*b
//
//})
//simplificando podemos tirar o a e o b e o in , pois para cada argumento eu tenho uma chave/constante que a linguagem me devolve, ela cria sozinha e me empresta  que seria o $ e um numero que representa o indice do argumento.
//calculate(10, 20, operation: {
//    return $0/$1
//
//})

//Já que minha closure so tem uma linha de codigo e obrigatoriamente ela precisa ser o retorno posso tirar o return
//calculate(10, 20, operation: { $0/$1 })

//já que estou usando operador binario e ele precisa de dois operando eu não preciso explicitamente colocar os numero entre o operador ficando assim:
//calculate(10, 20, operation: / ) //mas so usa assim sem as chaves se a closure for o ultimo parametro da sua funcao

//Quando a closure é o ultimo argumento ela permite ser colocada do lado de fora

//calculate(10, 20) { $0/$1 } // deforma forma matamos o "operation:, enao é possivel colocar somente o vezes aqui nesse cenario são necessarios os argumentos junto ao operador binario"
import Foundation
var names = [
    "   Alessandra   ",
    "   Jessica",
    "Anderson   ",
    "Denys  ",
    "Harley  "
]
print(names)
//map = mapeia os elementos da colecao e devolve uma nova colecao com esses elementos mapeados
//nesse caso $0 representa cada um desses elementos
//esse metodo trimmingCharacteres remove alguns caracteres e vem do Foundantion
//entao estou pegando cada item do meu array $0 e removendo os espacos em branco e isso vai me devolver um novo array

let correctedNames = names.map({$0.trimmingCharacters(in: CharacterSet.whitespaces)}) //retira os espacos em branco
print(correctedNames)

//fazer o array retonar letras em maiusculo

let uppercaseNames = correctedNames.map({$0.uppercased()})
print(uppercaseNames)

let rodrigues = correctedNames.map({$0 + " Rodrigues"})
print(rodrigues)

//filter - devolve elementos que cumprem um certo requisito

//pega cada elemento do array e devolve um novo array somente com elemntos com menos de 7 letras
let newNames = correctedNames.filter({$0.count < 7})
print(newNames)


//Reduce

//let sumLetters = correctedNames.reduce(0, {$0 + $1.count})
//print(sumLetters) //retona 36 
