//
//  ViewController.swift
//  ProjectCollectionView
//
//  Created by Алтын on 11/12/20.
//

import UIKit

class ViewController: UIViewController {

    var array = [1, 2, 3, 4, 5, 6, 7, 8]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCollectionViewCell") as?  CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: array[indexPath.item] ?? UIImage())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeFromItemAt indexPath: IndexPath) -> CGSize {
        
        let side = collectionView.frame.size.width / 2 - 5
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView)
    
    
}

