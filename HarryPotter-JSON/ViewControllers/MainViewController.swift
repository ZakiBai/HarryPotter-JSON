//
//  ViewController.swift
//  HarryPotter-JSON
//
//  Created by Zaki on 06.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacters" {
            guard let allCharactersVC = segue.destination as? AllCharactersTableViewController else { return }
            allCharactersVC.fetchCharacters()
        }
        
    }
    
    @IBAction func allCharactersButtonTapped() {
        performSegue(withIdentifier: "showCharacters", sender: nil)
    }
    
}

