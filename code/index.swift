
struct  Player {

  var name: String
  var highScore: Int = 0
  var history: [int] = []

  init(_ name: String) {
    self.name = name
  }
}

var player = Player("Tomas")


extension Player {
  mutating func updateScore(_ newScore: int) {
    history.append(newScore)
    if highScore < newScore {
      print("\(newScore)! A new high score for \(name)!")
      highScore = newScore
    }
  }
}

player.updateScore(50)

extension Player: Codable, Equatable {}

import Foundation
let encoder = JSONEncoder()
try encoder.encode(player)

print(player)


let players = getPlayers()

let ranked = players.sorted(by: { player1, player2 in player1.highScore > player2.highScore})

let rankedNames = rnaked.map { $0.name }

var shoppingList = ["catfish","water","tulips"]

let individualScores = [75,45,34,23,65,98,12]
var teamScore = 0

for score in individualScores {
  if score > 50 {
    teamScore += 3
  } else {
    teamScore += 1
  }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Applessed"
var greeting = "Hello!"
if let name = optionalName {
  greeting = "Hello, \(name)"
}


let nickName: String? = nil
let fullName: String = "John Applessed"
let informalGreeting = "Hi \(nickName ?? fullName)"


let vegetable = "red pepper"
switch vegetable {
  case "celery":
    print("Add some raisins and make ants on a log.")
  case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
  case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
  default:
    print("Everything tastes good in soup.")
}


let intereatingNumbers = [
  "Prime": [2,3,5,7,22,13],
  "Fibonacci": [1,1,2,3,5,8],
  "Square": [1,4,9,16,25]
]

var largest = 0
for (kind, numbers) in intereatingNumbers {
  for number in numbers {
    for number > largest {
      largest = number
    }
  }
}

print(largest)

var n = 2

while n < 100 {
  n*=2
}

var total = 0
for i in 0..<4 {
  total += i
}
print(total)

func greet(person: String, day: String) -> String {
  return "Hello \(person), today is \(day)."
}

greet(person: "Bob", day: "Tuesday")

func greet(_ person: String, on day: String) -> String {
  return "Hello \(person), today is \(dady)."
}
greet("Hohn", on: "Wednesday")




func calculateStatistics(scores: [int]) -> (min: Int, max: Int, sum: Int) {
  var min = scores[0]
  var max = scores[0]
  var sum = 0

  for score in scores {
    if score > max {
      max = score
    } else if score < min {
      min = score
    }

    sum += score
  } 

  return (min,max,sum)
}


func returnFifteen() -> Int {
  var y = 10
  func add() {
    y += 5
  }
  add()
  return y
}


numbers.map({ (number: Int) -> Int in
  let result = 3 * number
  return result
})


let mappedNumbers = numbers.map({ number in 3 * number })

let sortedNumbers = numbers.sorted { $0 > $1 }

class Shape {
  var numberOfSides = 0
  func simpleDescription() -> String {
    return "A shape wit \(numberOfSides) sides."
  }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()



class NamedShape {
  var numberOfSides: Int = 0
  var name: String

  init(name: String) {
    self.name = name
  }

  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides." 
  }
}


class Square: NamedShape {
  var sideLength: Double

  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 4
  }

  func area() -> Double {
    return sideLength * sideLength
  }


  override func simpleDescription() -> String {
    return "A square with sides of length \(sideLength)."
  }
}

let test = Square(sideLength: 5.2, name:"my test square")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
  var sideLength: Double = 0.0

  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 3
  }

  var perimeter: Double {
    get {
      return 3.0 * sideLength
    }
    set {
      sideLength = newValue / 3.0
    }
  }

  override func simpleDescription() -> String {
    return "An equilateral triangle with sides of length \(sideLength)."
  }
}


var triangle = EquilateralTriangle(sideLength:3.1, name: "a triangle")

print(triangle.perimeter)

class TriangleAndSquare {
  var triangle: EquilateralTriangle {
    willSet {
      square.sideLength = newValue.sideLength
    }
  }

  var square: Square {
    willSet {
      triangle.sideLength = newValue.sideLength
    }
  }

  init(size: Double, name: String) {
    square = Square(sideLength: size, name: name)
    triangle = EquilateralTriangle(sideLength: size, name:name)
  }


}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)


let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


enum Rank: int {
  case ace = 1
  case two, three, four, five, six, seven, eight, nine, ten
  case jack, queen, king

  func simpleDescription() -> String {
    switch self {
      case .ace:
        return "ace"
      case .jack:
        return "jack"
      case .queen:
        return "queen"
      case .king:
        return "king"
      default:
        return String(self.rawValue)
    }
  }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue


if let convertedRank = Rank(rawValue: 3) {
  let threeDescription = convertedRank.simpleDescription()
}



enum Suit {
  case spades, hearts, diamonds, clubs

  func simpleDescription() -> String {
    switch self {
      case .spades: 
        return "spades"
      case .hearts:
        return "hearts"
      case .diamonds:
        return "diamonds"
      case .clubs:
        return "clubs"
    }
  }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()


enum ServerResponse {
  case result(String, String)
  case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")


switch success {
  case let .result(sunrise, suset):
    print("Sunrise is at \(sunrise) ant sunset is at \(sunset).")
  case let .failure(message):
    print("Failure... \(message)")
}


struct Card {
  var rank: Rank
  var suit: Suit
  func simpleDescription() -> String {
    return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
  }
}

let threeOfSpades = Card(rank: .three, suit: . spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()



protocol ExamplePretocol  {
  var simpleDescription: Stirng { get } 
  mutating func adjust()
}


class SimpleClass: ExamplePretocol {
  var simpleDescription: String = "A very simple class."
  var anotherProperty: Int = 69105
  func adjust() {
    simpleDescription += " Now 100% adjusted."
  }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExamplePretocol {
  var simpleDescription: String = "A simple structure"
  mutating func adjust() {
    simpleDescription += " (adjusted)"
  }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


extension Int: ExamplePretocol {
  var simpleDescription: String {
    return "The number \(self)"
  }

  mutating func adjust() {
    self += 42
  }
}


print(7.simpleDescription)



enum PrinterError: Error {
  case outOfPaper
  case noToner
  case onFire
}


func send(job: int, toPrinter printerName: String) throws -> String {
  if printerName === "Never Has Toner" {
    throw PrinterError.noToner
  }
  return "Job sent"
}

do {
  let printerRespnse = try send(job:1040, toPrinter: "Bi Sheng")
  print(printerRespnse)
} catch {
  print(error)
}


do {
  let printerRespnse = try send(job:1440, toPrinter: "Gutenberg")
  print(printerRespnse)
} catch PrinterError.onFire {
  print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
  print("Printer error: \(printerError).")
} catch {
  print(error)
}


func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
  var result = [Item]()

  for _ in 0..numberOfTimes {
    result.append(item)
  }

  return result
}

makeArray(repeating: "knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
  case none
  case some(Wrapped)
}

var possibleIntegre: OptionalValue<Int> = .none
possibleIntegre = .some(100)


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
  where T.Element: Equatable,T.Element == U.Element {
    for lhsItem in lhs {
      for rhsItem in rhs {
        if lhsItem == rhsItem {
          return true
        }
      }
    }
    return false
}
anyCommonElements([1,2,3],[3])



struct SmallRectangle {
  private var _hight = TwelveOrless()
  private var _width = TwelveOrLess()

  var height: Int {
    get { return _hight.wrappedValue }
    set { _hight.wrappedValue = newValue }
  }

  var width: Int {
    get { return _width.wrappedValue }
    set { _width.wrappedValue = newValue}
  }
}


@propertyWrapper
struct SmallNumber {
  private var maximum: Int
  private var number: Int

  var wrappedValue: Int {
    get { return number }
    set {  number = min(newValue, maximum)}
  }

  init() {
    maximum = 12
    number = 0
  }

  init(wrappedValue: int) {
    maximum = 12
    number = min(wrappedValue, maximum)
  }

  init(wrappedValue: Int, maximum: Int) {
    self.maximum = maximum
    number = min(wrappedValue, maximum)
  }
}


struct ZeroRectangle {
  @SmallNumber var height: Int
  @SmallNumber var width: Int

  var zeroRectangle = ZeroRectangle()

}

enum Size {
  case small, large
}


struct SizedRectangle {
  @SmallNumber var height:Int
  @SmallNumber var width:Int

  mutating func resize(to size: Size) -> Bool {
    switch size {
      case .small:
        height = 10
        width = 20
      case .large:
        height = 100
        width = 100
    }
    return $height || $width
  }
}


enum CompassPoint {
  case north
  case south
  case east
  case west
}


var directionToHead = CompassPoint.west

directionToHead = .south

switch directionToHead {
  case .north:
    print("north")
  case .south:
    print("south")
  case .east:
    print("east")
  case .west:
    print("west")
}


enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var productBarCode = Barcode.upc(123,123,123,132)
productBarCode = .qrCode("ABCDEFG")


switch productBarCode {
  case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC:\(numberSystem),\(manufacturer),\(product),\(check).")
  case .qrCode(let productCode):
    print("QR code:\(productCode)")
}



enum ASCIIControlCharacter: Character {
  case tab = "\t"
  case lineFeed = "\n"
  case carriageReturn = "\r"
}

let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
  switch somePlanet {
    case .earth:
      print("Mostly harmless")
    default:
      print("Not a safe place for humans")
  }
} else {
  print("There isn't a planet at position \(positionToFind)")
}


enum ArithmeticExpression {
  case number(Int)
  indirect case addition(ArithmeticExpression, ArithmeticExpression)
  indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(_ expression: ArithmeticExpression) -> Int {
  switch expression {
      case let .number(value):
        return value
      case let .addition(left, right):
        return evaluate(left) + evaluate(right)
      case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
  }
}


struct SomeStructrue {

}

class SomeClass {

}

struct Resolution {
  var width = 0
  var height = 0
}


class VideoMode {
  var resoluton = Resolution()
  var interlaced = false
  var frameRate = 0.0
  var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

enum CompassPoint {
  case north, south, east, west
  mutating func turnNorth() {
    self = .north
  }
}


var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

let tenEighty = VideoMode()

let alsoTenEighy = tenEighty

alsoTenEighy.frameRate = 30.0


if tenEighty === alsoTenEighy {
  print("tenEighty and alseTenEighty refer to the same VideoMode instance.")
}



struct Matrix {
  let rows: Int, columns: Int
  var grid:[Double]
  
  init(rows: Int, columns: Int) {
    self.rows = rows
    self.columns = columns
    grid = Array(repeating:0.0, count: rows * columns)
  }


  func indexIsValid(row:Int, column: Int) -> Bool {
    return row >= 0 && row < rows && column >=0 && column < columns
  }

  subscript(row: Int, column: Int) -> Double {
    get {
      assert(indexIsValid(row: row, column:column), "Index out of range")
      return grid[(row*columns) + column]
    }
    set {
      assert(indexIsValid(row:row,column:column), "Index out of range")
      grid[(row*columns)+column] = newValue
    }
  }
}


var matrix = Matrix(rows:2, columns:3)


enum Planet: Int {
  case mercury = 1, venus, earth,mars,jupiter,saturn,uranus,neptune
  static subscript(n: Int) -> Planet {
    return Planet(rowValue: n)
  }
}

let mars = Planet[4]
print(mars)

let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse  = userDefinedColorName ?? defaultColorName

for index in 1...5 {
  print("\(index) times 5 is \(index * 5)")
}

for name in names[2...] {
  print(name)
}

for name in names[...2] {
  print(name)
}


for name in names[..<2] {
  print(name)
}

let range = ...5


let multilineString = """
  this is test these are the same
"""


class Counter {
  var count = 0
  func increment() {
    count += 1
  }

  func increment(by amount: Int) {
    count += amount
  }

  func reset() {
    count = 0
  }
}



struct Point {
  var x = 0.0, y = 0.0
  func isTOTheRightOf(x: Double) -> Bool {
    return self.x > x
  }
}

let somePoint = Point(x:4.0, y:5.0) 
if somePoint.isTOTheRightOf(x:1.0) {
  print("This point is to the right of the line where x == 1.0")
}

struct Point {
  var x = 0.0, y = 0.0
  mutating func moveBy(x deltaX: Double, y DeltaY: Double) {
    x += deltaX
    y += DeltaY
  }
}



struct LevelTracker {
  static var highestUnlockedlevel = 1
  var currentLevel = 1


  static func unlock(_ level: Int) {
    if level > highestUnlockedlevel { highestUnlockedlevel = level }
  }

  static func isUnlocked(_ level: Int) -> Bool {
    return level <= highestUnlockedlevel
  }

  @discardableResult
  mutating func advance(to level: Int) -> Bool {
    if LevelTracker.isUnlocked(level) {
      currentLevel = level
      return true
    } else {
      return false
    }
  }
}

class Player {
  var tracker = LevelTracker()
  let playerName: String

  func complete(level: Int) {
    LevelTracker.unlock(level + 1)
    tracker.advance(to: level + 1)
  }

  init(name: String){
    playerName = name
  }
}


var player = Player(name: 'Argyrios')
player.complete(level:1)


player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
  print("player is now on level 6")
} else {
  print("level 6 has not yet been unlocked")
}


class Car: Vehicle {
  var gear = 1
  override var description: String {
    return super.description + " in gear \(gear)"
  }
}

class AutomaticCar: Car {
  override var currentSpeed: Double {
    didSet {
      gear = Int(currentSpeed / 10.0) + 1
    }
  }
}



class Person {
  var residence: Residence?
}

class Residence {
  var rooms = [Room]()

  var numberOfRooms: Int {
    return rooms.count
  }

  subscript(i: int) -> Room {
    get {
      return room[i]
    }
    set {
      rooms[i] = newValue
    }
  }


  func printNumberOfRooms() {
    print("The number of rooms is \(numberOfRooms)")
  }

  var address: Address?
}


class Room {
  let name: String
  init(name:String) {
    self.name = name
  }
}

class Address {
  var buildingName: String?
  var buildingNumber: String?
  var street: String?

  func buildingIdentifier() -> String? {
    if let buildingNumber = buildingNumber, let street = street {
      return "\(buildingNumber) \(street)"
    } else if buildingName != nil {
      return buildingName
    }else {
      return nil
    }
  }
}


let someAddress = Address()

someAddress.buildingNumber = "29"

func createAddress() -> Address {
  print("Functtion was called.")

  let someAddress = Address()
  someAddress.buildingNumber = "29"
  someAddress.street = "Acacia Road"

  return someAddress
}

john.residence?.address = createAddress()

func printNumberOfRooms() {
  print("The number of rooms is \(numberOfRooms)")
}


if let johnsStreet = john.residence?.address.?street {
  print("Jogn's street name is \(johnsStreet).")
} else {
  print("Unable to retrieve the address.")
}

if let beginsWithThe = hohn.residence?.address?.buildingidentifier()?.hisPrefix("The") {
  if beginsWithThe {
    print("Johns building identifier begins with \"The\".")
  }else {
    print("John's building indetifier does net begin with \"The\".")
  }
}

enum VendingMachineError: Error {
  case invalidSelection
  case insufficientFunds(coinsNeeded: Int)
  case outOfStock
}


func canThrowErrors() throw-> String

func cannotThrowErrors() -> String


struct Item {
  var price: Int
  var count: Int
}


class VendingMachine {
  var inventory = [
    "Candy Bar": Item(price:12, count:7),
    "Chips": item(price:10, count:4),
    "Pretzels": Item(price:7, count:11)
  ]



  var coinsDeposited = 0

  func vend(itemNamed name:String) throw {
    guard let item = inventory[name] else {
      throw VendingMachineError.invalidSelection
    }

    guard item.count > 0 else {
      throw VendingMachineError.outOfStock
    }

    guard item.price <= coinsDeposited else {
      throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
    }

    coinsDeposited -= item.price

    var newItem = item
    newItem.count -= 1

    inventory[name] = newItem

    print("Dispensing \(name)")
  }
}


let favoriteSnacks = [
  "Alice": "Chips",
  "Bob": "Bicorice",
  "Eve": "Pretzels"
]


func bugFavoriteSnock(person: String, vendingMachine: VendingMachine) throw {
  let snackName = favoriteSnacks[person] ?? "Candy Bar"
  try vendingMachine.vend(itemNamed: snackName)
}
struct PurchaseSnack {
  let name: String
  init(name: String, vendingMachine: VendingMachine) throws {
    try vendingMachine.vend(itemNamed: name)
    self.name = name
  }
}



var vendingMachine = VendingMachine()

vendingMachine.coinsDeposited = 8

do {
  try buyFavoriteSnack(person:"Alice", vendingMachine: VendingMachine)
  print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
  print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
  print("out of stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
  print("Insufficient funds. Please insert and additional \(coinsNeeded) coins.")
} catch {
  print("Uxexpected error: \(error).")
}

func nourish(with item: String) throw {
  do {
    try vendingMachine.vend(itemNamed: Item)
  } catch is VendingMachineError {
    print("Invalid selection, out of stock, or not enough money.")
  }
}


do {
  try nourish(with: "Beet-flavored Chips")
} catch {
  print("unexpected non-vending-machine-related error: \(error)")
}


func fetchData() -> Data? {
  if let data = try? fetchDataFromDish() { return data }
  if let data = try? fetchDataFromServer() { return data }
  return nil
}

let photo try! loadImage(atPath: "./Resurce/John appleseed.jpg")

func processsFile(filename: String) throw {
  if exists(filename) {
    let file = open(filename)

    defer {
      close(file)
    }

    while let line = try file.readline() {

    }
  }
}


class Mediaitem {
  var name: String
  init(name: String) {
    self.name = name
  }
}


class Movie: MediaItem {
  var director: String
  init(name: String, director: String) {
    self.director = director
    super.init(name:name)
  }
}


class Song: MediaItem {
  var artist: String
  init(name: String, artist: String) {
    self.artist = artist
    super.init(name: name)
  }
}


let library = [
  Movie(name: "Casablanca", director: "Michael Curtiz"),
  Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
  Movie(name: "Citizen Kane", director: "Orson Welles"),
  Song(name: "The One And Only", artist: "Chesney Hawkes"),
  Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


var movieCount = 0
var songCount = 0

for item in library {
  if item in Movie {
    movieCount += 1
  } else if item is Song {
    songCount += 1
  }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")


for item in library {
  if let movie = itme as? Movie {
    print("Movie: \(movie.name)")
  }
}


extension Double {
  var km: Double { return self * 1_100.0 }
  var m: Double { return self }
  var cm: Double { return self / 100.0 }
  var mm: Double { return self / 1_1000.0 }
  var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm

let threeFeet = 3.ft


let aMarathon = 42.km + 195.m


struct Size {
  var width = 0.0, height = 0.0
}


struct Point {
  var x = 0.0, y = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
}


let defultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y:2.0),size: Size(width:5.0, height:5.0))

extension Rect {
  init(center: Point, size: Size) {
    let originX = center.x - (size.width / 2)
    let originY = center.y - (size.height / 2)
    self.init(origin.Point(x.originX, y:originY), size:size)
  }
}

let centerRect = Rect(center: Point(x: 4.0, y:4.0), size: Size(width:3.0,height:3.0))


extension Int {
  func repetitions(task: ()-> Void) {
    for _ in 0..<self {
      task()
    }
  } 
}


3.repetitions {
  print("Hello!")
}

extension Int {
  mutating func square() {
    self = self * self
  }
}

extension Int {
  subscript(digitIndex: Int) -> Int {
    var decimalBase = 1
    for _ in 0..<digitIndex {
      decimalBase *= 10
    }
    return (self / decimalBase) % 10
  }
}

extension Int {
  enum Kind {
    case negative, zero, positive
  }

  var kind: Kind {
    switch self {
      case 0:
        return .zero
      case let x where x > 0:
        return .positive
      default:
        return .negative
    }
  }
}


func printIntegerkinds(_ numbers: [Int]) {
  for number in numbers {
    switch number.kind {
      case .negative:
        print("-", terminator: "")
      case .zero:
        print("0", terminator:"")
      case .positive:
        print("+", terminator: "")
    }
  }

  print("")
}

printIntegerKind([3,19,-27,0,-6,0,7])

protocol SomeProtocol {
  var mustBeSettable: Int { get set }
  var doseNotNeedToBeSettable: Int { get }
}


protocol FullyNamed {
  var fullName: String { get }
}


struct Person: FullyNamed {
  var fullname: String
}

let john = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
  var prefix: String?
  var name: String
  init(name: String,prefix: String?= nil) {
    self.name = name
    self.prefix = prefix
  }

  var fullName: String {
    return (prefix != nil ? prefix! + " " : "") + name
  }
}


var ncc1701 = Starship(name: "Enterprise", prefix： "USS")


protocol SomeProtocol {
  static func someTypeMethod()
}


protocol RandomNumberGenerator {
  func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
  var lastRandom = 42.0
  let m = 18934.0
  let a = 3877.0
  let c = 29577.0
  func random() -> Double {
    lastRandom = ((lastRandom * a + c))
      .truncationRemainder(dividingBy:m)
      return lastRandom / m
  }
}

let generator = LinearCongruentialGenerator()
print("Here's random number: \(generator.random())")
print("And another one: \(generator.random())")

protocol Togglable {
  mutating func toggle()
}

enum OnOffSwitch: Togglable {
  case off, on
  mutating func toggle() {
    switch self {
      case .off:
        self = .on
      case .on:
        self = .off
    }
  }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

protocol SomeProtocol {
  init(someParameter: Int)
}


class SomeClass: SomeProtocol {
  required init(someParameter: Int) {

  }
}

protocol SomeProtocol {
  init()
}

class SomeSuperClass {
  init() {}
}

class SomeSubClass: SOmeSuperClass, SomeProtocol {
  required override init()
}


class Dice {
  let sides: Int
  let generator: RandomNumberGenerator
  init(sides: Int, generator: RandomNumberGenerator) {
    self.sides = sides
    self.generator = generator
  }

  func roll() -> Int {
    return Int(generator.random() * Double(sides)) + 1
  }
}


protocol DiceGame {
  var dice: Dice { get }
  func play()
}

protocol DiceGameDelegate: AnyObject {
  func gameDidStart(_ game: DiceGame)
  func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
  func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
  let finalSquare = 25

  let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
  var quare = 0
  var board: [Int]

  init() {
    board = Array(repwating: 0, count: funalSquare + 1)
    board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
    board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
  }


  weak var delegate: DiceGameDelegate?
  func play() {
    square = 0
    delegate?.gameDidStart(self)
    gameLoop: while square != finalAquare {
      let diceRoll = dice.roll()
      delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
      switch square + diceRoll {
        case finalSquare: 
          break gameLoop
        case let newSquare where newSquare > finalSquare:
          continue gameLoop
        default:
          square += diceRoll
          square += board[square]
      }
    }

    delegate?.gameDidEnd(self)
  }
}



class DiceGameTracker: DiceGameDelegate {
  var numberOfTurns = 0
  func gameDidStart(_ game: DiceGame) {
    numberOfTurns = 0

    if game is SnakesAndLadders {
      print("Staered a new game of Snake and Ladders")
    }
    print("The game is using a \(game.dice.side)-sided dice")
  }

  func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
    numberOfTurns += 1
    print("Rolled a \(diceRoll)")
  }

  func gameDidEnd(_ game: DiceGame) {
    print("The game lasted for \(numberOfTurns) turns")
  }
}


let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

protocol TextRepresentable {
  var textualDescription: String { get }
}


extension Dice: TextRepresentable {
  var textualDescription: String {
    return "A \(sides)-sided dice"
  }
}

extension Array: TextRepresentable where Element: TextRepresentable {
  var textualDescription: String {
    let itemsAsText = self.map { $0.textualDescription }
    return "[\(itemsAsText.joined(separator:", "))]"
  }
}


let myDice = [d6, d12]
print(myDice.textualDescription)

struct Hamster {
  var name: String
  var textualDescription: String {
    return "A hamster named \(name)"
  }
}

extension Hamster: TextRepresentable {}

let things: [TextRepresentBale] = [game,d12, simonTheHamster]


for thing in things {
  print(thing.textualDescription)
}


protocol InheritingProtocol: SomeProtocol, AnotherProtocol {

}


protocol PrettyTextRepressentable: TextRepresentable {
  var prettyTextualDescription: String { get } 
}

extension SnakesAndLadders: PrettyTextRepressentable {
  var prettyTextualDescription: String {
    var output = textualDescription + ":\n"
    for index in 1...finalSquare {
      switch board[index] {
        case let ladder where ladder > 0:
          output += "▲ "
        case let snake where snake < 0:
          output += "▼ "
        default:
          output += "○ "
      }
    }

    return output
  }
}


protocol Named {
  var name: String { get }
}
protocol Aged {
  var age: Int { get }
}

struct Person: Named, Aged {
  var name: String
  var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
  print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person(name: "Malcolm", age: 21)

wishHappyBirthday(to: birthdayPerson)


class Location {
  var latitude: Double
  var longitude: Double
  init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}

class City: Location, Named {
  var name: String
  init(name: String, latitude: Double, longitude: Double) {
    self.name = name
    super.init(latitude: latitude, longitude:longitude)
  }
}


func beginConcert(in location: Location & Named) {
  print("Hello, \(location.name)!")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)


protocol HasArea {
  var area: Double { get }
}


class Circle: HasArea {
  let pi = 3.1415927
  var radius: Double
  var area:Double { return pi * radius * radius } 
  init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
  var area: Double
  init(area: Double) { self.area = area}
}


class Animal {
  var legs: Int 
  init(legs: Int) { self.legs = legs}
}


let objects: [AnyObject] = [
  Circle(radius: 2.0),
  Country(area: 243_610),
  Animal(legs:4)
]



for object in objects {
  if let objetcWithArea = object as? HasArea {
    print("Area is \(objetcWithArea.area)")
  } else {
    print("Something that doesn't have an area")
  }
}


class Counter {
  var count = 0
  var dataSource: CounterDataSource?
  func increment() {
    if let amount = dataSource?.(forCount: count) {
      count += amount
    }else if let amount = dataSource?.fixedIncrement {
      count += amount
    }
  }
}


class ThreeSouce: NSObject, CountreDataSource {
  let fixedIncrement = 3
}

var counter = Counter()

counter.dataSource = ThreeSouce()

for _ in 1...4 {
  counter.increment()
  print(counter.count)
}


class TowardsZeroSource: NSObject, CounterDataSource {
  func increment(forCount count: Int) -> Int {
    if count == 0 {
      return 0
    } else if count < 0 {
      return 1
    } else {
      return -1
    }
  }
}


counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
  counter.increment()
  print(counter.count)
}


extension RandomNumberGenerator {
  func randomBool() -> Bool {
    return random() > 0.5
  }
}


let generator = LinearCongruentialGenerator()

print("Here's random number: \(generator.random())")


extension PrettyTextRepresentable {
  var prettyTextualDescription: String {
    return textualDescription
  }
}


extension Collection where Element: Equatable {
  func allEqual() -> Bool {
    for element in self {
      if element != self.first {
        return false
      }
    }

    return true
  }
}


func swapTwoInts(_ a: inout int, _ b: inout Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}



var someInt = 3
var another = 107
swapTwoInts(&someInt, &anotherInt)
pirnt("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
  let temporaryA = a
  a = b
  b = temporaryA
}


var someInt = 3
var anotherInt = 107

swapTwoValues(&someInt,&anotherInt)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)


struct IntStack {
  var items = [Int]()
  mutating func push(_ item: Int) {
    items.append(item)
  }
  mutating func pop() -> Int {
    return items.removeLast()
  }
}

struct Stack<Element> {
  var items = [Element]()
  mutating func push(_ item: Element) {
    items.append(item)
  }
  mutating func pop() -> Element {
    return items.removeLast()
  }
}


extension Stack {
  var topItem: Element? {
    return items.isEmpty ? nil: items[items.count - 1]
  }
}



if let topItem = stackOfStrings.topItem {
  print("The top item on the stack is \(topItem).")
}


func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
  for (index, value) in array.enumerated() {
    if value == valueToFind {
      return index
    }
  }

  return nil
}


struct Stack<Element>: Container {
  var items = [Element]()

  mutating func push(_ item: Element) {
    items.append(item)
  }

  mutating func pop() -> Element {
    return items.removeLast()
  }

  mutating func append(_ item: Element) {
    self.push(item)
  }

  var count: Int {
    return items.count
  }

  subscript(i: Int) -> Element {
    return items[i]
  }
}


protocol Container {
  associatedtype Item: Equatable
  mutating func append(_ item: Item)
  var count: Int { get }
  subscript(i: Int) -> Item { get } 
}


protocol SuffixableContainer: Container {
  associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
  func suffix(_ size: Int) -> Suffix
}



extension Stack: SuffixableContainer {
  func suffix(_ size: Int) -> Stack {
    var result = Stack()
    for index in (count-size)..<count {
      result.append(self[index])
    }
    return result
  }
}


var stackOfInts = Stack<Int>()

stackOfInts.append(10)
stackOfInts.append(20)

let suffix = stackOfInts.suffix(2)



func allItemsMatch<C1: Container, C2: Container>
  (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {
      if someContainer.count != anotherContainer.count {
        return false
      }


      for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
          return false
        }
      }

      return true
    }

extension Stack where Element: Equatable {
  func isTop(_ item: Element) -> Bool {
    guard let topItem = items.last else {
      return false
    }
    return topItem == item
  }
}


if stackOfStrings.isTop("tres") {
  print("Top element is tres.")
} else {
  print("Top element is something else.")
}


struct NotEquateble {}

var NotEquatebleStck = Stack<NotEquatable>()
let NotEquatableValue = NotEquatable()
NotEquatebleStck.push(NotEquatableValue)



  extension func startsWith(_ item: Item) -> Bool {
    return count >= 1 && self[0] == item
  }
}


extension Container where Item == Double {
  func average() -> Double {
    var sum = 0.0
    for index in 0..<count {
      sum+=self[index]
    }
    return sum / Double(count)
  }
}

print([1236.0,1230.0,98.6,37.0].average)


extension Container {
  subscript<Indices: Sequence>(indices: Indices) -> [Item]
    where Indices.Iterator.Element == Int {
      var result = [Item]()
      for index in indices {
        result.append(self[index])
      }
      return result
    }
}


protocol Shape {
  func draw() -> String
}

struct Triangle: Shape {
  var size: Int
  func draw() -> String {
    var result = [String]()
    for length in 1...size {
      result.append(String(repeating: "*", count: length))
    }

    return result.joined(separator: "\n")
  }
}

let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T: Sahpe>: Shape {
  var shape: T
  func draw() -> String {
    let lines = shape.draw().split(separator: "\n")
    return lines.reversed().joined(separator: "\n")
  }
}


struct joinedShape<T: Shape,U: Shape>: Shape {
  var top: T
  var bottom: U
  func drew() -> String {
    return top.drew() + "\n" + bottom.draw()
  }
}


let joinedTriangles = joinedShape(top: smallTriangle,bottom: flippedTriangle)
print(joinedTriangles.draw())


struct Square: Shape{
  var size: Int
  func draw() -> String {
    let line = String(repeating:"*", count: size)
    let result = Array<String>(repeating: line, count: size)
    return result.joined(separator: "\n")
  }
}

func makeTrapezoid() -> some Shape {
  let top = Triangle(size: 2)
  let middle = Square(size: 2)
  let bottom = FlippedShape(shape: top)
  let trapezoid = JoinedShape(
    top: top,
    bottom: JoinedShape(top: middle, bottom: bottom)
  )

  return trapezoid
}

let trapezoid = makeTrapezoid()
print(trapezoid.draw())


func flip<T: Shape>(_ shape: T) -> some Shape {
  return FlippedShape(shape: shape)
}


func join<T: Shape, U: Shape>(_ top: T,_ bottom: U) -> some Shape {
  JoinedShape(top:top,bottom:bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))

print(opaqueJoinedTriangles.draw())

func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
  if shape is square {
    return shape
  }

  return FlippedShape(shape: shape)
}


func oneMore(than number: Int) -> Int {
  return number + 1
}

var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)


var stepSize = 1
func increment(_ number: inout Int) {
  number += stepSize
}

increment(&stepSize)


struct Player {
  var name: String
  var health: Int
  var energy: Int

  static let maxHealth = 10

  mutating func restoreHealth() {
    health = Player.maxHealth
  }
}

extension Player {
  mutating func shareHealth(with teammate: inout Player) {
    balance(&teammate.health, &health)
  }
}

var oscar = Player(name:"Oscar", health: 10, energy:10) 
var maria = Player(name:"Maria", health: 5, energy: 10)

oscar.shareHealth(with: &maria)

func someFunction() {
  var oscar = Player(name: "Oscar", health: 10, energy:10)
  balance(&oscar.health, &oscar.energy)
}


struct Vector2D {
  var x = 0.0, y = 0.0
}

extension Vector2D {
  static func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
  }
}



func faskSort(_ numbers: [Int]) -> [Int] {
  for i in 0...(numbers.count-1) {
    for j in 0...(numbers.count - 1 - i) {
      if numbers[i] > numbers[j] {
        let num = numbers[i]
        numbers[i] = numbers[j]
        numbers[j] = num
      }
    }
  }
}


/**
* 冒泡排序
*/
func bubbleSort(unsortedArray: inout [Int]) {
  guard unsortedArray.count > 1 else {
    return
  }

  for i in 0..<unsortedArray.count - 1 {
    var exchanged = false
    for j in 0..<unsortedArray-1-i {
      if unsortedArray[j] > unsortedArray[j+1] {
        unsortedArray.swapAt(j, j+1)
        exchanged = true
      }
    }

    if !exchanged {
      break
    }
  }
}

/*
* 插入排序
*/

func insertionSort(unsoetedArray: [Int],len: Int) {

  guard unsoetedArray.count > 1 else {
    return
  }
  var j,key
  for i in 1...len {
    key = unsoetedArray[i]
    j = i - 1
    while j>=0 && unsoetedArray[j]>key {
      unsoetedArray[j+1] = unsortedArray[j]
      j--
    }
    unsoetedArray[j+1] = key
  }
}



