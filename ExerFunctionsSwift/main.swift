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
func multiply ( _ number1: Int, by number2: Int) -> Int {
    return number1 * number2
}
print(multiply(10, by: 20))

      
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
