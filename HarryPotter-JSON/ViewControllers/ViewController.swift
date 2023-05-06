//
//  ViewController.swift
//  HarryPotter-JSON
//
//  Created by Zaki on 06.05.2023.
//

import UIKit

class ViewController: UIViewController {

    let link = URL(string: "https://hp-api.onrender.com/api/characters")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacter()
    }
    
    private func fetchCharacter() {
        URLSession.shared.dataTask(with: link) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode([Character].self, from: data)
                print(characters)
            } catch {
                print(error)
            }
        }.resume()
    }


}

