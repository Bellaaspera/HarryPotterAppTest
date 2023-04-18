//
//  CollectionViewController.swift
//  StarWarsAppTest
//
//  Created by Светлана Сенаторова on 17.04.2023.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters()
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: characters[indexPath.item])
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailes", sender: nil)
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 2.5, height: 200)
    }
}

// MARK: - Networking

extension CollectionViewController {
    private func fetchCharacters() {
        NetworkManager.shared.fetch([Character].self, from: Link.characters.rawValue) { [weak self] result in
            switch result {
            case .success(let characters):
                self?.characters = characters
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - Navigation

extension CollectionViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailesVC = segue.destination as? DetailesViewController else { return }
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        detailesVC.character = characters[indexPath.item]
    }
}
