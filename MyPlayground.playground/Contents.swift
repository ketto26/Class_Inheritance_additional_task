import Foundation

//                  -- 1--

class Animal {
    let name: String
    let species: String
    let age: Int
    
    init(name: String, species: String, age: Int){
        self.name = name
        self.species = species
        self.age = age
    }
 
    func makeSound(){
        print("Animal sound")
    }
    
    required init() {
            fatalError("Animal class is abstract and cannot be created directly.")
        }
    
}

//                  -- 2 --

class Mammal: Animal {
    let furColor: String
    override func makeSound() {
        print("Mammals voice")
    }
    
    init(name: String, age: Int, furColor: String) {
        self.furColor = furColor
        super.init(name: name, species: "Mammal", age: age)
    }
    
    convenience init(name: String, furColor: String) {
        self.init(name: name, age: 0, furColor: furColor)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

//                  -- 3 --

class Bird: Animal {
    let canFly: Bool
    override func makeSound() {
        print("Birds sound")
    }
    
    init(name: String, age: Int, canFly: Bool) {
        self.canFly = canFly
        super.init(name: name, species: "Bird", age: age)
    }
    
    convenience init(name: String, canFly: Bool) {
        self.init(name: name, age: 0, canFly: canFly)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

//                  -- 4 --
class Reptile: Animal {
    let isColdBlooded: Bool
    override func makeSound() {
        print("Reptile sound")
    }
    
    init?(name: String, age: Int, isColdBlooded: Bool) {
        if age < 0 {
            return nil
        }
        self.isColdBlooded = isColdBlooded
        super.init(name: name, species: "Reptile", age: age)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

//                  -- 5 --

class Lion: Mammal {
    let mainColor: String
    
    override func makeSound() {
        print("Lion sounds like GRRRRR")
    }
    
    init(name: String, age: Int, furColor: String, mainColor: String) {
        self.mainColor = mainColor
        super.init(name: name, age: age, furColor: furColor)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

//                  -- 6 --

class Eagle: Bird {
    let wingspan: Double
    
    override func makeSound() {
        print("Eagles sound like Peal Call")
    }
    
    init(name: String, age: Int, canFly: Bool, wingspan: Double) {
        self.wingspan = wingspan
        super.init(name: name, age: age, canFly: canFly)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

//                  -- 7 --

class Snake: Reptile {
    let length: Double
    
    override func makeSound() {
        print("Snake sounds like sssssssssss")
    }
    
    init?(name: String, age: Int, isColdBlooded: Bool, length: Double) {
        self.length = length
        super.init(name: name, age: age, isColdBlooded: isColdBlooded)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

//                  -- 8 --
// Added required init() with fatal error

//                  -- 9 --

var animalsOfZoo: [Animal] = []
animalsOfZoo.append(Mammal(name: "Red Panda", age: 2, furColor: "Red"))
animalsOfZoo.append(Mammal(name: "Lemur", age: 2, furColor: "Black and white"))
animalsOfZoo.append(Bird(name: "Ostrich", age: 1, canFly: false))
animalsOfZoo.append(Bird(name: "Flamingo", age: 25, canFly: true))
if let komodo = Reptile(name: "Komodo Dragon", age: 3, isColdBlooded: true) {
    animalsOfZoo.append(komodo)
}
if let mamba = Reptile(name: "Mamba", age: 1, isColdBlooded: true) {
    animalsOfZoo.append(mamba)
}
animalsOfZoo.append(Lion(name: "Lion King", age: 10, furColor: "Golden orange", mainColor: "Brown"))
animalsOfZoo.append(Eagle(name: "Aoba", age: 27, canFly: true, wingspan: 1.8))
if let seraphim = Snake(name: "Seraphim S-Snake", age: 4, isColdBlooded: true, length: 6.95) {
    animalsOfZoo.append(seraphim)
}

//                  -- 10 --

for animal in animalsOfZoo {
    print("The zoo animal: \(animal.name) specie of \(animal.species) is \(animal.age) years old.")
    animal.makeSound()
    print()
}
