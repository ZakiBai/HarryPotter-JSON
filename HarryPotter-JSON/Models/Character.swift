//
//  Character.swift
//  HarryPotter-JSON
//
//  Created by Zaki on 06.05.2023.
//

import Foundation

struct Character: Decodable {
    let name: String
    let yearOfBirth: Int?
    let wizard: Bool
    let eyeColour: String
    let alternateNames: [String]?
    let wand: Wand?
    let image: String
    
    init(name: String, yearOfBirth: Int?, wizard: Bool, eyeColour: String, alternateNames: [String]?, wand: Wand?, image: String) {
        self.name = name
        self.yearOfBirth = yearOfBirth
        self.wizard = wizard
        self.eyeColour = eyeColour
        self.alternateNames = alternateNames
        self.wand = wand
        self.image = image
    }
 
    init(from characterData: [String: Any]) {
        name = characterData["name"] as? String ?? ""
        yearOfBirth = characterData["yearOfBirth"] as? Int
        wizard = characterData["wizard"] as? Bool ?? false
        eyeColour = characterData["eyeColour"] as? String ?? ""
        alternateNames = characterData["alternateNames"] as? [String]
        wand = characterData["wand"] as? Wand
        image = characterData["image"] as? String ?? ""
    }
    
    static func getCharacters(from value: Any) -> [Character] {
        guard let charactersData = value as? [[String: Any]] else { return []}
        return charactersData.map { Character(from: $0)}
    }
    
}

struct Wand: Decodable {
    let wood: String
    let core: String
    let length: Double?
    
    init(wood: String, core: String, length: Double?) {
        self.wood = wood
        self.core = core
        self.length = length
    }
    
    init(from characterWand: [String: Any]) {
        wood = characterWand["wood"] as? String ?? ""
        core = characterWand["core"] as? String ?? ""
        length = characterWand["length"] as? Double
     }
    
    
}
