//
//  AllCharactersTableViewController.swift
//  HarryPotter-JSON
//
//  Created by Zaki on 10.05.2023.
//

import UIKit

final class AllCharactersTableViewController: UITableViewController {
    
    // MARK: - Private properties
    private var characters: [Character] = []
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 170
        fetchCharacters()
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        guard let cell = cell as? CharacterInfoCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure(character: character)
        return cell
    }

}

// MARK: - Network Manager
extension AllCharactersTableViewController {
    
    func fetchCharacters() {
        networkManager.fetchCharacters(from: Link.characterURL.url) { [weak self] result in
            switch result {
            case .success(let charactersData):
                self?.characters = charactersData
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
}
