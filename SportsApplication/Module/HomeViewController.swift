//
//  HomeViewController.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 21/05/2024.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var collectionViewStyleIcon: UIButton!
    let sports = [Sport(name: "Football", image: "Soccer"),
                     Sport(name: "Basketball", image: "Basketball"),
                     Sport(name: "Cricket", image: "Cricket"),
                     Sport(name: "Tennis", image: "Tennis")]
    var isList : Bool = true
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
                
        cell.sportsImage.image = UIImage(named: sports[indexPath.row].image)
        cell.sportsName.text = sports[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let padding: CGFloat = 10
                    let collectionViewSize = collectionView.frame.size.width - padding
                    let collectionViewHeight = collectionView.frame.size.height - padding
                    let cellHeight = collectionViewHeight / 2
                    let cellWidth = collectionViewSize / 2
                    return CGSize(width: cellWidth - padding, height: cellHeight)
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    @IBAction func ChangeStyleBtn(_ sender: UIButton) {
        if (isList){
            collectionViewStyleIcon.setImage(UIImage(systemName: "list.bullet"), for: .normal)
            isList = false
            HomeCollectionView.reloadData()
        }else{
           collectionViewStyleIcon.setImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
            isList = true
            HomeCollectionView.reloadData()
        }
    }
    
    

}




