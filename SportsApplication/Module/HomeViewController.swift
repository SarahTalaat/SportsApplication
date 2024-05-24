//
//  HomeViewController.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 21/05/2024.
//

import UIKit
import Reachability

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    let sports = [Sport(name: "Football", image: "football"),
                     Sport(name: "Basketball", image: "basketball"),
                     Sport(name: "Cricket", image: "cricket"),
                     Sport(name: "Tennis", image: "tennis")]
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
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.borderColor = UIColor(named: "BackgroundColor")?.cgColor
        cell.contentView.layer.cornerRadius = 20
        cell.layer.cornerRadius = 20
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width*0.45), height: (collectionView.bounds.width*0.85))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10)
    }
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        let reachability = try! Reachability()
        if reachability.connection != .unavailable {
            if  let leagues = storyboard.instantiateViewController(withIdentifier:  "LeagueViewController") as? LeagueViewController{
                //Network().sport = sports[indexPath.row].name.lowercased()
                leagues.sportName = sports[indexPath.row].name.lowercased()
                print(sports[indexPath.row].name.lowercased())
                navigationController?.pushViewController(leagues, animated: true)
            }
            
        } else {
            self.present(showAlert(), animated: true)
        }
    }
    
   
    
    func showAlert() -> UIAlertController{
        let alert = UIAlertController(title: "Error!", message: "please check your connection and try again later", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK",style: UIAlertAction.Style.default,handler:nil))
        return alert
    }
    
    

}




