//: Playground - noun: a place where people can play

import UIKit

// METHOD TRIM

func trim (line: String, with: String) -> String {
    
    var newLine = line
    
    while (newLine.contains(with)) {
        var charactersArray = Array(newLine.characters)
        let index = newLine.distance(from: newLine.startIndex, to: newLine.range(of: with)!.lowerBound) //  range(of : )!.lowerBound - находит индекс первого элемент совпадения with в newLine
        for _ in 0 ..< with.characters.count {
            charactersArray.remove(at: index)
        }
        newLine = String(charactersArray)
    }
    return newLine
}

let test = trim(line : "delllxl l xx lx lx flff l wxxwlww", with: "flf")
print (test)


// GAME OF THROES

// CLASS UNIT
class Unit : CustomStringConvertible {
    public var nickname : String
    public var health : Double
    public var damage : Double
    public var armor : Double
    public var dexterity : Double
    public var numbersOfWins : Int = 0
    public var numbersOfDefeats : Int = 0
    
    init(nickname : String, health : Double, damage : Double, armor : Double, dexterity : Double) {
        self.nickname = nickname
        self.health = health
        self.damage = damage
        self.armor = armor
        self.dexterity = dexterity
    }
    
    public var description: String {
        return "\(self.nickname) has hp : \(self.health); damage : \(self.damage); armor : \(self.armor); dext : \(self.dexterity)"
    }
    
    public func attack(to enemy: Unit) {
        if (enemy.armor > 0) { //  First need to destroy the protection
            enemy.armor = enemy.armor - self.damage
        } else {
            enemy.health = enemy.health - (self.damage/enemy.dexterity) // Then Unit hasn't armor, he becomes dexterous
        }
    }
    
    public func setWon() {
        numbersOfWins += 1
    }
    
    public func setLost() {
        numbersOfDefeats += 1
    }
    
}

// CLASS LANNISTER
class Lannister : Unit {

    override init(nickname : String, health : Double, damage : Double, armor : Double, dexterity : Double){
        super.init(nickname : nickname, health : health, damage : damage, armor : armor, dexterity : dexterity)
    }
    
}

// CLASS STARK
class Stark : Unit {
    
    override init(nickname: String, health: Double, damage: Double, armor: Double, dexterity: Double) {
        super.init(nickname: nickname, health: health, damage: damage, armor: armor, dexterity: dexterity)
    }

}

// CLASS MORMONT
class Mormont : Unit {
    
    override init(nickname: String, health: Double, damage: Double, armor: Double, dexterity: Double) {
        super.init(nickname: nickname, health: health, damage: damage, armor: armor, dexterity: dexterity)
    }
    
}


// CLASS BATTLEGROUND
class Battleground {
    
    public var players : [Unit] = []
    
    public func beginBattle(members : Unit ...) {
        print("--------------BEGIN BATTLE------------")
        self.players = members
        
        var currentPlayer = 0
        
        var currentPlayerIsLast : Bool = false
        while (players.count > 1) {
            for attacker in currentPlayer ..< players.count {
                if (attacker == players.count-1) {
                    currentPlayerIsLast = true
                    break
                } else {
                    fight(attacer: players[attacker], enemy: players[attacker+1])
                    if (players[attacker + 1].health > 0) {
                        print("RESULT : " + players[attacker + 1].nickname + " is live")
                        currentPlayer = attacker + 1
                    } else {
                        removeMember(number: attacker+1)
                        if (attacker == players.count - 1) {
                            currentPlayer = 0
                            break
                        }
                    }
                }
            }
            
            if (currentPlayerIsLast) {
                let attacer = players[players.count-1]
                let enemy = players[0]
                fight(attacer: attacer, enemy: enemy)
                if (enemy.health > 0) {
                    print("RESULT : " + enemy.nickname + " is live \n")
                } else {
                    removeMember(number: 0)
                }
                currentPlayer = 0
                currentPlayerIsLast = false
            }
        }
        print("\n /////-----THE END----/////")
        print("All members : " )
        for number in 0...members.count - 1 {
            print(members[number].nickname)
        }
        print("\n Winner is " + players[0].nickname)
        print("------------------------------------------")
        players[0].setWon()
    }
    
    public func fight(attacer : Unit, enemy : Unit) {
        print("\n /////BEFORE FIGHT/////")
        print(attacer.description)
        print(enemy.description)
        print("/////START FIGHT : KILL HIM!/////")
        print(attacer.nickname + " attaced " + enemy.nickname)
        attacer.attack(to: enemy)
        print("/////AFTER FIGHT/////")
        print(attacer.description)
        print(enemy.description)
        print("-------------------------------------------")
    }
    
    public func removeMember(number : Int) {
        print("RESULT : " + players[number].nickname + " was killed ")
        players[number].setLost()
        players.remove(at: number)
    }
}


// TABLE OF TOTALS
class TableOfTotals {
    
    func createTable(members : Unit ...) {
        print("\n ---------TABLE OF TOTALS---------")
        var tempArray : [Unit] = members
        tempArray.sort { $0.numbersOfWins > $1.numbersOfWins}
        printTable(array : tempArray)
    }
    
    func printTable(array : [Unit]) {
        print("№...Nickname...W...L")
        for number in 0...array.count - 1 {
            print("\(number+1). " + array[number].nickname + "....\(array[number].numbersOfWins)" + "....\(array[number].numbersOfDefeats)")
        }
    }
}

// CLASS TEST

var lannisterJaime : Unit = Lannister(nickname: "Jaime", health: 100, damage: 50, armor: 100, dexterity: 1)
var starkNed : Unit = Stark(nickname: "Ned", health: 100, damage: 50, armor: 100, dexterity: 1)
var mormontJorah : Unit = Mormont(nickname: "Jorah", health: 100, damage: 50, armor: 100, dexterity: 1)
var lannisterTywin : Unit = Lannister(nickname: "Tywin", health: 100, damage: 50, armor: 100, dexterity: 1)
var starkRob : Unit = Stark(nickname: "Rob", health: 100, damage: 50, armor: 100, dexterity: 1)
var mormontLyanna : Unit = Mormont(nickname: "Lyanna", health: 100, damage: 50, armor: 100, dexterity: 1)

func preporationBeforeBattle (members : Unit ...) {
    for member in members {
        member.health = 100
        member.damage = Double(arc4random_uniform(100))
        member.armor = Double(arc4random_uniform(100))
        member.dexterity = member.dexterity*drand48() * 2
    }
}

let battleGround : Battleground = Battleground()
let tableOfTotals : TableOfTotals = TableOfTotals()
for _ in 0...5 {
    preporationBeforeBattle(members: lannisterJaime, starkNed, mormontJorah, lannisterTywin, starkRob, mormontLyanna)
    battleGround.beginBattle(members: lannisterJaime, starkNed, mormontJorah, lannisterTywin, starkRob, mormontLyanna)
}

tableOfTotals.createTable(members: lannisterJaime, starkNed, mormontJorah, lannisterTywin, starkRob, mormontLyanna)

