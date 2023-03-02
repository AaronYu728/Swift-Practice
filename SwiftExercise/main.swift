//
//  main.swift
//  SwiftExercise
//
//  Created by BinYu on 1/3/2023.
//

import Foundation

//MARK: Array Operation
/*================Array Operation ============Start=====*/
//There are three ways to declare an empty array
//1、Recommendation way
var emptyNumbers: [Int] = [] //Common way
//2
var newArray = [Int]()
//3
var emptyNumbers2: Array<Int> = Array()

var numbers = [22, 11, 10, 7, 13]

//numbers For loop
for (index, value) in numbers.enumerated(){
    print(index, value)
}

for (index, value) in zip(numbers.indices, numbers) {
    print(index, value)
}

//prints 0 22, 1 11, 2 10, 3 7, 4 13

for (i, character) in "Bruce".enumerated() {
    print(i, character)
}
//prints 0 E, 1 m, 2 m, 3 e, 4 t, 5 t

//numbers.sort() //Change numbers and sort numbers in ascending order by default
//numbers.sort(by: >) //Change numbers and sort numbers in descending order

//Sort the original array using a closure------ start
//1、The simplest closure sort
//numbers.sort(by: {$0 > $1}) ascending，descending {$0 < $1}
//2、Extend closure sorting of code
numbers.sort(by: {(n1: Int, n2: Int) -> Bool in
    return n1 < n2 //ascending， n1 > n2 descending
})
//print(numbers)
//Sort the original array using a closure------ end

//*sorted()---Do not change the original array, the newly generated array has been sorted
//let sortedNumbers = numbers.sorted() Default ascending order, descending--numbers.sorted(by: >)

//Generate a new sorted array with closures------start
//1、The simplest closure sort
//let sortedNumbers = numbers.sorted(by: {$0 < $1}) ascending，descending {$0 > $1}
//print(sortedNumbers)
//2、Extend closure sorting of code
let reversed = numbers.sorted(by: {(n1: Int, n2: Int) -> Bool in
    return n1 < n2 //升序，n1 > n2为降序
})
//print(reversed)
//Generate a new sorted array with closures------end

//Strings can also be sorted, ascending ABCD, and descending DCBA
// ["Bruce", "Jackie", "Jerry", "Oliver", "Tom"]
var names = ["Bruce", "Oliver", "Jackie", "Tom", "Jerry"]
var namesCopy = names.count
let sortedNames = names.sorted(by: <)
//print(sortedNames)

//Array map function: This closure function is called once for each element in array A and returns new array B (unchanged from the original array A) with elements in B as mapped values in A (elements in B can have different types than elements in the original array A).
let newMapNumbers = numbers.map({ (number: Int) -> Int in
    let result = 4 * number
    return result
})
//print(newMapNumbers)

//Exercise: Convert an array of numbers Int [23, 68, 250] to an array containing the corresponding String
//["TwoThree", "SixEight", "TwoFiveZero"]
let intToStringDic = [
    0: "Zero",1: "One",2: "Two",3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
]
let intArray = [23, 68, 250]
//The following map function has only one argument, the closure, so the () after the map can be omitted according to the trailling closure syntax
let stringArray = intArray.map({number -> String in
    var outPut = ""
    //In the while loop, number needs to be changed to match the loop condition, but number is an immutable constant known in intArray, so a var variable temNum is defined here to receive number
    var temNum: Int = number
    while temNum > 0 {
        //In the case of 23, the outPut after "=" has a value of Three on the second loop, and temNum has a value of 2 on the second loop
        outPut = intToStringDic[temNum % 10]! + outPut
        temNum /= 10
    }
    return outPut
})
//print(stringArray)

var strFamilyNames = ["Oliver"]
//Determines if the array is empty
if strFamilyNames.isEmpty {
    print("The name list is empty.")
} else {
    print("The name list is not empty.")
}
//add element
strFamilyNames.append("Jackie")
strFamilyNames.append(contentsOf: ["Bruce", "Emily", "John"])
strFamilyNames += ["Jack", "Bluce"]
strFamilyNames.insert("Tom", at: 3)
//prints ["Oliver", "Jackie", "Bruce", "Tom", "Emily", "John", "Jack", "Bluce"]
//alter data
strFamilyNames[4] = "Jerry"
strFamilyNames[3...4] = ["Tomy", "Jerryer"]
//prints ["Oliver", "Jackie", "Bruce", "Tomy" "Jerryer", "John", "Jack", "Bluce"]
//replace subarray
strFamilyNames.replaceSubrange(6...7, with: ["A", "B"])
//prints ["Oliver", "Jackie", "Bruce", "Tomy", "Jerryer", "John", "A", "B"]

strFamilyNames.remove(at: 6)//remove the element of the specified index

strFamilyNames.removeFirst()//remove the first 1 element
strFamilyNames.removeFirst(3)//remove the first 3 elements

strFamilyNames.removeLast()//remove the last 1 element
strFamilyNames.removeLast(3)//remove the last 3 elements
//print(strFamilyNames)
if strFamilyNames.contains("Tomy") {//Determine if it contains a certain element
    print("There is Tomy inside strFamilyNames.")
}
print(strFamilyNames.suffix(2))//get the last 2 elements
print(strFamilyNames.prefix(2))//get the first 2 elements
//Prints elements of index that start and end with the index matched to
if let i = strFamilyNames.firstIndex(of: "Aaron") {
    print(strFamilyNames[i..<strFamilyNames.endIndex])
}

//Array comparison
if strFamilyNames.elementsEqual(stringArray) {
    print("the same")
}
if strFamilyNames == stringArray {
    print("We are same.")
}else {
    print("We are different.")
}

//Remove vowels from the string
var phrase = "The rain in Austrilia stays mainly int plain."
let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
phrase.removeAll(where: {
    vowels.contains($0)
})
//print(phrase)
/*================Array Operation ============End=====*/



//MARK: Closures Operation
/*================Closures Operation ============Start=====*/
//A closure needs to declare a variable/constant (the name of the closure) to be accepted. The syntax is
// let closureName = {(val1: String, val2: Int, ...) -> Bool in
//     statement-1
//     statement-2
//     ...
//     statement-n
//
//     return true
// }

//Like a function without arguments, keep "(argument) -> (return value)"
var closure0: () -> (String) = {
    return "Hello closure."
}

//The simplest parameterless closure
var closure1 = {
    return "Hello closure."//No return value required
}

//Variable closures that need to be passed in multiple arguments
//1、Closure names followed by colons should not be commonly used
var closure2: (_ name: String, _ age: Int) -> String = {name,age in
    return "My name is \(name), My age is \(age)"
}
//print(closure2("Aaron", 30))
//2、This should be the usual closure notation, where Swift cannot infer the types of arguments and return values
var introduction = {(name: String, age: Int, nationality: String) -> String in
    let aWord = "My name is \(name), I'm \(age) years old, I'm \(nationality)"
    return aWord
}
//let giveMeAWord = introduction("Aaron", 30, "Chinese")
//print(giveMeAWord)


//Sort the array in ascending order using the closure (passed into the function as an argument) to get the new array, which is unchanged
var newNumbers = [22, 11, 10, 7, 13]
let sortedNumbers = newNumbers.sorted(by: {(number1: Int, number2: Int) -> Bool in
    return number1 < number2
})
//print(sortedNumbers)

//Multiplies an array by itself with a closure and returns a new array
var oneToFive = [1, 2, 3, 4, 5]
let sortedOneToFive = oneToFive.map({(num: Int) -> Int in
    return num * num
})
//print(oneToFive)
//print(sortedOneToFive)


//Swift can infer the types of parameters and return values and omit the types of parameters and return values, abbreviated as follows
let sortedNum = numbers.sorted(by: {number1, number2 in
    return number1 > number2
    
})
//print(sortedNum)

var newNames = ["Jack", "Oliver", "Bruce", "Tom", "Jerry"]

//When the closure is the last argument to a function, you can simply follow the closure after the function ()
//If the function needs to close only one argument, we can omit the () of the function.
//let sortedNames = newNames.sorted{$0 > $1}
let sortedNewNames = newNames.sorted(){$0 > $1}
//print(sortedNewNames)
/*================Closures Operation ============End=====*/


//MARK: Switch Control
/*================Switch Control ============Start=====*/
//1、Like OC, a single condition executes a single branch
var someValue: Int = 0
someValue = 10
switch someValue {
case 1:
    print("This is one.")
case 2:
    print("This is two.")
default:
    print("This is \(someValue).")
}
//2、Multiple conditions execute the same branch
var someCharacter: Character = "a"
someCharacter = "o"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel.")
//    break(No required. You can't omit 'break' in C)
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n",
     "v", "w", "x", "y", "z", "p", "q", "r", "s", "t":
    print("\(someCharacter) is a consonant.")
//    break(No required. You can't omit 'break' in C)
default:
    print("\(someCharacter) is not a vowel or a consonant.")
}
//3、A condition can also be a range of values
let count = 3000
let countedThings = "stars in the Milky Way"
var naturalCount: String
switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "handreds of"
case 1000...999999:
    naturalCount = "thounsands of"
default:
    naturalCount = "millions of"
}
print("Thera are \(naturalCount) \(countedThings)")

//4、Conditions can also be tuples
let somePoint = (5, 5)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin!")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis!")
case (0, _):
    print("(0, \(somePoint.1) is on the y-axis!")
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y.")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is at the origin!")
case (let x, let y):
    print("let x = \(somePoint.0), let y = \(somePoint.1)")
default:
    //break (If default does not have stament, then a break is required to end)
    print("(\(somePoint.0), \(somePoint.1) is outside of the box.")
}
//print("(1, 1) is inside the box.")
//5、Use fallthrough to branch switch through the execution
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 9, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an interger."
}
print(description)
/*================Switch Control ============End=====*/



//MARK: Optional & Optional Chain
/*================Optional & Optional Chain ============Start=====*/
//In Swift, we cannot directly assign nil to a variable when declaring it like in Objective-C. Instead, we need to add a question mark "?" after the type of the variable to indicate that it can be optional. For example, declaring var str: String = nil will result in an error, and you need to add a "?" after the type like this -- var opStr: String? = nil
var opStr: String?
opStr = nil
if opStr != nil{
    print(opStr!)
}else{
    print("opStr is nil")
}

//Optional can be used to indicate any type of variable in Swift, including Int, Float, and so on
var ageInt: Int?
ageInt = 36
if ageInt == 36 {
    print("I am \(String(describing: ageInt)) years old.")
}else{
    print("I am not a tiger")
}

//Forced unwrapping
//In Swift, when you have determined that an optional variable contains a value, you can use an exclamation mark "!" after the variable name to access its value. If you don't use the exclamation mark, the output or usage of the variable will include the "Optional" label, like this:

var myStr: String?
myStr = "Hello, Swift!"
if myStr != nil {
    print(myStr!)
}else{
    print("myStr is not nil")
}
//prints Optional("Hello, Swift!")
//So, we need to add ! (Exclamation mark) to access the
//variable, For example:
var hsStr: String?
hsStr = "Hello Swift!"
if hsStr != nil {
    print(hsStr!) //Add '!' after it.
}else{
    print("hsStr is not nil!")
}
//prints  Hello Swift!

//Optional binding to determine whether optStr has a value, if it has a value, it is assigned to the tempStr variable
var optStr: String? = "Hello Swift!"
if let tempStr = optStr {
    print(tempStr)
}else{
    print(optStr!)
}
//prints Hello Swift!

//Optional Chain
class Person {
    var residence: Residence?
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int{
        return rooms.count
    }
    //This method determines whether Residence can be accessed through the subscript
    subscript(i: Int) -> Room {
        return rooms[i]
    }
    func printNumberOfRooms() {
        print("The room number is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String){
        self.name = name
    }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var streetName: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if buildingNumber != nil {
            return buildingNumber
        }else {
            return nil
        }
    }
}
let Jack = Person()
//residence can be accessed using subscripts because of the subscript definition used in the Residence class
//if let firstRoomName = Jack.residence?[0].name {
//
//}
let jackHouse = Residence()
jackHouse.rooms.append(Room(name: "Living room"))
jackHouse.rooms.append(Room(name: "Kitchen"))
Jack.residence = jackHouse

let jackAddress = Address()
jackAddress.buildingName = "The Wellington"
jackAddress.streetName = "Wellington Road"
Jack.residence!.address = jackAddress

//Any value of this chain is nil, it will return 'nil' instead of crash
if let jackAddress = Jack.residence?.address?.streetName {
    print("Oliver's street address is \(jackAddress)")
}else{
    print("The address could not be searched.")
}
/*================Optional & Optional Chain ============End=====*/



//MARK: Properties in Class and Swift
/*================Properties in Class and Swift============Start=====*/
//类的计算属性: 通过传值计算出属性的值,不是直接获取存储属性
class SampleClass {
//    lazy var spStr = classString()
//    var spStr = classString()
    var fValue1 = 0.0, fValue2 = 2.0
    var length = 100.0, breadth = 120.0
    var middleValue: (Double, Double){
        get{//属性middleValue的get方法
            return (length/2, breadth/2)
        }
        set(param){//属性middleValue 的set方法
            fValue1 = param.0 - length/2
            fValue2 = param.1 - breadth/2
        }
    }
}

var sampClass = SampleClass()
//The get method of middleValue is called
print(sampClass.middleValue)
//Call the set method of middleValue, and the new values of fValue1 and fValue2 have been calculated
sampClass.middleValue = (60.0, 70.0)
//Get the new values of fValue1 and fValue2 directly
print(sampClass.fValue1)
print(sampClass.fValue2)

//Read-only computed property, only get no set, cannot set a new value
class OWen {
    var height = 80 //cm
    var weight = 12 //kg
    var age = 2 //years
    var gender = "boy"
    
    var Info: [String: String]{
        return [
            "height": String(self.height),
            "weight": String(self.weight),
            "age": "\(self.age)",
            "gender": self.gender
        ]
    }
}
var myBaby = OWen()
//let babyBriefIntroduction = "I have a \(myBaby.Info["gender"]!), his name is OWen. He is a \(myBaby.Info["age"]!)-month-old boy, he is \(myBaby.Info["height"]!) cnetimeters tall, he weighs \(myBaby.Info["weight"]!) kilograms."
let babyBriefIntroduction = "I have a \(myBaby.gender), his name is OWen. He is a \(myBaby.age)-month-old boy, he is \(myBaby.height) cnetimeters tall, he weighs \(myBaby.weight) kilograms."
print(babyBriefIntroduction)


//property observer -- willset, didset -----start
class Samplegm {
    var counter: Int = 0{
        willSet(newNumber){
            print("The value it's going to be assigned is\(newNumber)")
        }
        didSet{
            if counter > oldValue {
                print("The value before the assignment is\(oldValue)")
            }
        }
    }
}
let NewCounter = Samplegm()
NewCounter.counter = 10
NewCounter.counter = 20

//Listen for property changes using the property's set method
class OliverS {
    var _firstName: String?
    var firsName: String{
        get{
            return _firstName!
        }
        set{
            _firstName = newValue
        }
    }
    
    var _familyName: String?
    var familyName: String {
        get{
            return _familyName!
        }
        set{
            _familyName = newValue
        }
    }
}
var classOliverS = OliverS()
classOliverS.firsName = "Oliver"
print(classOliverS.firsName)
classOliverS.familyName = "S"
print(classOliverS.familyName)
//property observer -- willset, didset -----end

//Identity judgment========start
class FamilyClass: Equatable {
    let propertyOne: String
    init(str: String){
        propertyOne = str
    }
}

func == (lhs: FamilyClass, rhs: FamilyClass) -> Bool {
    return lhs.propertyOne == rhs.propertyOne
}
let fClass1 = FamilyClass(str: "Hello")
let fClass2 = FamilyClass(str: "Hello")
if fClass1 === fClass2 {
    //    print("Reference the same class instance \(fClass1)")
}

if fClass1 !== fClass2 {
    //    print("Reference the different class instance \(fClass2)")
}
//Identity judgment========end


//Use static to define the type property of the struct
struct StudMarks {
    static let markCount = 111
    var InternalMarks: Int = 0 {
        didSet {
            //When accessing an attribute with a 'static' keyword, it must be accessing using a class type
            if InternalMarks > StudMarks.markCount {
                InternalMarks = StudMarks.markCount
            }
        }
    }
}
var studMark = StudMarks()
studMark.InternalMarks = 112
print(studMark.InternalMarks)

//Use class to define the type attributes of the class
class className {
    class var name: String {
        return "Lily"
    }
}


//class propertis====1
class Famliy {
    //Properties in a class must have initial values. Structs don't have to
    var name: String = ""
    var age: Int = 0
    var weight: Int = 0
    var height: Int = 0
    
    //class requires custom constructors, which are generated automatically by struct
    //Using _ hides the external name of the parameter
    init(_ paraNme: String, _ paraAge: Int, _ paraWeight: Int, _ paraHeight: Int){
        self.name = paraNme
        self.age = paraAge
        self.weight = paraWeight
        self.height = paraHeight
    }
    
    //Provide the external name of the parameter
    init(memName: String, memAge: Int, memWeight: Int, memHeight: Int){
        
    }
}

var fmClass1 = Famliy(memName: "OWen", memAge: 10, memWeight: 10, memHeight: 80)
var fmClass2 = Famliy("OWen", 10, 10, 80)//The external name of the parameter is hidden
//print(fmClass.weight)

//class propertis====2
class Ted {
    var age: Int
    var height: Int
    var hobby: String
    init(){
        //If a variable is not initialized when you declare it, you can initialize it in the init method. If no value is assigned in the declaration or init, an error is reported
        age = 18
        height = 165
        hobby = "acting"
    }
}

//destructor
var counter = 0
class  BaseClass {
    //Each class can have multiple constructors
    init(){
        counter += 1
    }
    //There can only have one destructor in each class
    deinit{
        counter -= 1
    }
}
var baseClass: BaseClass? = BaseClass()
print(counter)
baseClass = nil//Assign nil to class will trigger method 'deinit'
print(counter)
/*================properties in Class and Swift ============End=====*/


//MARK: LRU Algorithm
/*================LRU Algorithm============Start=====*/
//LRU (Least recently used) algorithm based on the history of data access to eliminate data. The idea is that "if data has been accessed recently, it has a higher chance of being accessed in the future". Using a bidirectional linked list and hashtable implementation, deletes and inserts can be done in O(1) time complexity

class HashNode {
    var key: Int
    var value: Int
    var preNode: HashNode?
    var nexNode: HashNode?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}

class LRUCache {
    //Store the Node hashmap based on the key
    private var hashCache: [Int : HashNode] = [:]
    //Maximum capacity of the hashCache
    private var maxSize: Int = 0
    //Current capacity of the hashCache
    private var currentSize: Int = 0
    //The head Node of hashmap
    private var headNode: HashNode?
    //The tail Node of hashmap
    private var tailNode: HashNode?
    
    init(_ capacity: Int) {
        maxSize = capacity
    }

    func get(_ key: Int) -> Int {
        if let node: HashNode = hashCache[key] {
            moveToHead(node)
            return node.value
        }
        return -1
    }

    func put(_ newkey: Int, _ newvalue: Int) {
        if let newNode = hashCache[newkey] {
            //If the node corresponding to the key already exists in the hashCache
            //Update the corresponding node in the hashCache
            hashCache[newkey]!.value = newvalue
            //If the node already exists in the hashCache, move it to the header
            moveToHead(newNode) //move to header
        } else {
            //If there is no node corresponding to the key in the hashCache, create a new node and add it to the header
            let newnode: HashNode? = HashNode(newkey, newvalue)
            addNewNode(newnode!) //Linked list operation

            //Update the data in the hashCache
            hashCache[newkey] = newnode!
            currentSize += 1
            if currentSize > maxSize {
                removeTail()
                currentSize -= 1
            }
        }
    }

    private func moveToHead(_ node: HashNode) {
        if node === self.headNode {
            return
        }

        //******remove node--start
        let temPre: HashNode?
        let temNex: HashNode?
        temPre = node.preNode //node's preNode
        temNex = node.nexNode //node's nextNode
        temPre?.nexNode = temNex //Point preNode's next to node's nextNode
        if temNex != nil {//If the node's next Node is not empty, node is not tail
            temNex?.preNode = temPre //Point preNode of node's nextNode to node's preNode
        } else {
            //If node's nextNode is empty as the node is tail, and leave node's preNode as a tailNode
            self.tailNode = temPre
            //Or leave nextNode of node's preNode nil
            //self.temPre.nexNode = nil
        }
        //******remove node--end

        //Add node to header
        addNodeToHead(node)
    }

    //Add a new node to header
    private func addNewNode(_ node: HashNode) {
        if self.headNode == nil {//If header is nil, it means there is no data in the hashCache, the new node is set as both the header and the tail node
            self.headNode = node
            self.tailNode = node
        } else {
            //Add to header
            addNodeToHead(node)
        }
    }

    //Add node to header
    private func addNodeToHead(_ node: HashNode) {
        let temHead: HashNode? = self.headNode //Primary head node
        self.headNode = node //Set node as the header node
        self.headNode?.nexNode = temHead //Points nextNode of current head node to the primary head node
        temHead?.preNode = self.headNode //Points primary head node to current head node
    }

    //remove tail node
    private func removeTail() {
        if let tempTail: HashNode = self.tailNode { //If there is A trailing node in the list
            hashCache.removeValue(forKey: tempTail.key) //Delete the original tail node A
            self.tailNode = tempTail.preNode //Set primary tail node A as the tail node B
            self.tailNode?.nexNode = nil //Set nextNode of current tail node B nil
        }
        return
    }
}
/*================LRU Algorithm============End=====*/
