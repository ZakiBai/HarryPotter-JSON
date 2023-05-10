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
        networkManager.fetchCharacters(from: networkManager.link) { [weak self] result in
            switch result {
            case .success(let dataCharacters):
                self?.characters = dataCharacters
            case .failure(let error):
                print(error)
            }
        }
        
//        URLSession.shared.dataTask(with: networkManager.link) { [weak self] data, _, error in
//            guard let data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                self?.characters = try decoder.decode([Character].self, from: data)
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            } catch {
//                print(error)
//            }
//        }.resume()
    }
}
