//
//  DetailesViewController.swift
//  StarWarsAppTest
//
//  Created by Светлана Сенаторова on 18.04.2023.
//

import UIKit

class DetailesViewController: UIViewController {
    
    @IBOutlet var characterTableView: UITableView!
    
    var character: Character?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
}

extension DetailesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        character?.name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Character.numberOfParameters.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailesCell", for: indexPath)
       
        var content = cell.defaultContentConfiguration()
        switch indexPath.row {
        case 0: content.image = image
            content.imageProperties.cornerRadius = 20
            content.imageProperties.maximumSize = CGSize(width: 140, height: 200)
        case 1: content.text = character?.actor
        case 2: content.text = character?.alternateNames?.joined(separator: ", ") ?? "No data"
        case 3: content.text = character?.species
        case 4: content.text = character?.gender
        case 5: content.text = character?.house
        case 6: content.text = character?.dateOfBirth
        case 7: content.text = character?.yearOfBirth?.formatted()
        case 8: content.text = character?.ancestry
        case 9: content.text = character?.eyeColour
        case 10: content.text = character?.hairColour
        case 11: content.text = character?.patronus
        default: content.text = character?.alternateActors?.joined(separator: ", ")
        }
        cell.contentConfiguration = content
        return cell
    }
    
    
}

extension DetailesViewController {
    
    private func fetchImage() {
        NetworkManager.shared.fetchImage(from: character?.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.image = UIImage(data: imageData) ?? UIImage(systemName: "person")
                self?.characterTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
