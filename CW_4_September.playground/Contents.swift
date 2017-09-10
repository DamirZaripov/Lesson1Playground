//: Playground - noun: a place where people can play

import UIKit

// Bubble Sort

var arrayForBS: Array<Int> = [222, 41, 132, 33, 44]

func bubbleSort (arrayForSort : inout [Int]) {
    
    for i in 0 ..< arrayForSort.count {
        for j in 0 ..< arrayForSort.count - 1 - i {
            if (arrayForSort[j] > arrayForSort[j + 1]) {
                let t = arrayForSort[j]
                arrayForSort[j] = arrayForSort[j + 1]
                arrayForSort[j + 1] = t
            }
        }
    }
}

bubbleSort(arrayForSort: &arrayForBS)

// 3 principles of OOP : Encapsulation, Inheritance, Polymorphism 

// NEW CLASS DOG
public class Dog : CustomStringConvertible {
    public var name: String
    public var age: Int
    private let typeOfAnimal : String = "Dog"
    
    public init(name: String, age: Int) {
        self.name = name 
        self.age = age
    }
    
    public func call () {
        print(name + " said you: \" - Hey, I am the Dog.\" ")
    }
    
    public var description: String {
        return "It is \(name). It is \(age) years old."
    }
    
    public func setNumbersOfCry(numbersOfCry: Int) {
        let numbersOfCry = numbersOfCry
        cry(numbersOfCry: numbersOfCry)
    }
    
    private func cry(numbersOfCry: Int) {
        for _ in 0...numbersOfCry - 1 {
            print("LAY")
        }
    }
}


// NEW CLASS HUNTING DOG
public class HuntingDog : Dog {

    public var wasOnHunt: Bool = false
    
    public init(name : String, age : Int, wasOnHunt : Bool) {
        super.init(name: name,age: age)
        self.wasOnHunt = wasOnHunt
    }
    
    override public func call() {
        super.call()
        print(name + " said you: \" - Oh, also I am the Hunting Dog.\"")
    }
    
    override public var description: String {
        return "It is \(name). It is \(age) years old. It is the Hunting Dog."
    }
    
}

// TEST CLASS
var dog1 : Dog = Dog(name: "Barsik", age: 10)
var dog2 : Dog = HuntingDog(name: "Rex", age: 12, wasOnHunt: false)

var arrayOfDogs: [Dog] = [dog1, dog2]

func printInfoAboutDogs( arrayOfDogs: [Dog]) {
    let arrayOfDogs = arrayOfDogs
    for element in arrayOfDogs {
        print(element.description)
        element.call()
        print("--------------")
    }
}

printInfoAboutDogs(arrayOfDogs: arrayOfDogs)
dog1.setNumbersOfCry(numbersOfCry: 5)


// STACK
struct Stack<T> {
    
    private var array = [T]()
    
    public func size() -> Int {
        return array.count
    }
    
    public func empty() -> Bool {
        return array.isEmpty
    }
    
    public func peek() -> T {
        return array[array.count - 1]
    }
    
    public mutating func pop() -> T {
        let temp : T = array[array.count - 1]
        array.remove(at: array.count - 1)
        return temp
    }
    
    public mutating func push(newElement : T ){
        array.append(newElement)
    }
    
}

// TEST MAIN

var sizeNow : Int
var peekNow : String
var popNow : String
var isEmptyNow : Bool

var testArray = Stack<String>()

//test push
testArray.push(newElement: "Test1")
testArray.push(newElement: "Test2")
testArray.push(newElement: "Test3")

//test size()
sizeNow = testArray.size()

//test peek()
peekNow = testArray.peek()

//test pop()
popNow = testArray.pop()
sizeNow = testArray.size()

//test epmty()
isEmptyNow = testArray.empty()

