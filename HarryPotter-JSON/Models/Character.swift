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
    let alternate_names: [String]?
    let wand: Wand?
    let image: String? // Если ставлю класс URL почему то выдает ошибку(
}

struct Wand: Decodable {
    let wood: String
    let core: String
    let length: Double?
}
