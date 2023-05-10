//
//  CharacterInfoCell.swift
//  HarryPotter-JSON
//
//  Created by Zaki on 10.05.2023.
//

import UIKit

final class CharacterInfoCell: UITableViewCell {
    
    @IBOutlet var charImage: UIImageView!
    @IBOutlet var charNameLabel: UILabel!
    @IBOutlet var charYearOfBirthLabel: UILabel!
    @IBOutlet var charColorOfEye: UILabel!
    @IBOutlet var charWandLabel: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(character: Character) {
        charNameLabel.text = "Name: \(character.name)"
        charYearOfBirthLabel.text = "Year of birth: \(character.yearOfBirth ?? 0)"
        charColorOfEye.text = "Color of Eye: \(character.eyeColour)"
        charWandLabel.text = "Wand wood: \(character.wand?.wood ?? "without wand")"
        
        guard let url = URL(string: character.image) else { return }
    
        networkManager.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.charImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}
