//
//  ViewController.swift
//  UICollectionView
//
//  Created by Александр Карпов on 11.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemMenuArray: [Menu] = {
        var blankMenu = Menu()
        blankMenu.name = "Coca-Cola"
        blankMenu.imageName = "cola"
        
        var blankMenu2 = Menu()
        blankMenu2.name = "Fanta"
        blankMenu2.imageName = "fanta"
        
        return [blankMenu, blankMenu2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    // segue preparing data
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu
                print(menu ?? "nil")
                vc.menu = menu
            }
        }
    }


}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            itemCell.menu = itemMenuArray[indexPath.row]
            
            return itemCell
        }
        return UICollectionViewCell()
    }
    
   // выбранную ячейку отправляем в сигвей
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = itemMenuArray[indexPath.row]
        self.performSegue(withIdentifier: "showVC", sender: menu)
    }
    
    
}
