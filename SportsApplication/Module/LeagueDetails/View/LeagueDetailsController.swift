//
//  LeagueDetailsController.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import UIKit
import JGProgressHUD

class LeagueDetailsController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate  {
    
    var sportName:String = " "
    var leagueId:Int = 0
    var leagueName:String = ""
    var leagueLogo:String = ""
    var dataCounter = 0
    var viewModel: LeagueDetailsViewModel!
    var indicator: UIActivityIndicatorView!

    @IBOutlet weak var detailsCollectionView: UICollectionView!
    @IBOutlet weak var favBtnApperance: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let upcomingEventCell = UINib(nibName: "UpComingEventCell", bundle: nil)
        detailsCollectionView.register(upcomingEventCell, forCellWithReuseIdentifier: "UpComingEventCell")
          
        let latestEventCell = UINib(nibName: "LatestEventCell", bundle: nil)
        detailsCollectionView.register(latestEventCell, forCellWithReuseIdentifier: "LatestEventCell")

        let teamCell = UINib(nibName: "TeamCell", bundle: nil)
        detailsCollectionView.register(teamCell, forCellWithReuseIdentifier: "TeamCell")
        
        detailsCollectionView.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        
        viewModel = LeagueDetailsViewModel()
        fetchLeagueData()
        setupLeagueData()
        checkFav()
        bindDataBase()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      indicator = UIActivityIndicatorView(style: .large)
      indicator.center = self.view.center
      self.view.addSubview(indicator)
      indicator.startAnimating()
    }
    
    func drawUpComingEventSection() -> NSCollectionLayoutSection{
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(232))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
      group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
      let section = NSCollectionLayoutSection(group: group)
      section.orthogonalScrollingBehavior = .groupPagingCentered
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 8)
      section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
                      layoutSize: headerSize,elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
        section.boundarySupplementaryItems = [header]
      return section
    }
    
    func drawLatestEventSection() -> NSCollectionLayoutSection{
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(232))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
      group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
      let section = NSCollectionLayoutSection(group: group)
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 8, trailing: 12)

      section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
                      layoutSize: headerSize,elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
        section.boundarySupplementaryItems = [header]
      return section
    }
    
    func drawTeamSection() -> NSCollectionLayoutSection{
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(132), heightDimension: .absolute(158))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
      group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
      let section = NSCollectionLayoutSection(group: group)
      section.orthogonalScrollingBehavior = .continuous
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 0)
      section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
      let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
      let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
      section.boundarySupplementaryItems = [header]
      return section
    }

    
    func fetchLeagueData(){
      viewModel.getUpcomingEvent(sportName: sportName, leagueId: "\(leagueId)", startDate: Constants.currentDate, endDate: Constants.nextYear)

      viewModel.getLatestEvent(sportName: sportName, leagueId: "\(leagueId)", startDate: Constants.previousYear, endDate: Constants.currentDate)

      viewModel.getTeams(sportName: sportName, leagueId: "\(leagueId)")
    }
    
    func setupLeagueData(){
      viewModel.resultToViewController = { [weak self] in
        self?.dataCounter += 1

        DispatchQueue.main.async {

          if(self!.dataCounter % 3 == 0){
            self?.indicator.stopAnimating()
            self?.detailsCollectionView.reloadData()
            let layout = UICollectionViewCompositionalLayout{
              index, environment in
              if self?.viewModel.upcomingEvent?.count ?? 0 == 0{
                switch index{
                case 0:
                  return self?.drawLatestEventSection()
                default:
                  return self?.drawTeamSection()
                }
              }else{
                switch index{
                case 0:
                  return self?.drawUpComingEventSection()
                case 1:
                  return self?.drawLatestEventSection()
                default:
                  return self?.drawTeamSection()
                }
              }
            }
            self?.detailsCollectionView.setCollectionViewLayout(layout, animated: true)
          }
        }
      }
    }
    
    func configureCellAppearance(_ cell: UICollectionViewCell) {
        cell.contentView.backgroundColor = .white
    
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.borderColor = UIColor.systemGray2.cgColor
        
        cell.contentView.layer.cornerRadius = 16
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 4.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.upcomingEvent?.count ?? 0 == 0{
          switch section{
          case 0:
            return viewModel.latestEvent?.count ?? 0
          default:
            return viewModel.teams?.count ?? 0
          }
        } else {
          switch section{
          case 0:
            return viewModel.upcomingEvent?.count ?? 0
          case 1:
            return viewModel.latestEvent?.count ?? 0
          default:
            return viewModel.teams?.count ?? 0
          }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let latestEventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestEventCell", for: indexPath) as! LatestEventCell
        let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCell
        let upComingEventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpComingEventCell", for: indexPath) as! UpComingEventCell
        
        
        configureCellAppearance(latestEventCell)
        configureCellAppearance(upComingEventCell)
        configureCellAppearance(teamCell)

        if viewModel.upcomingEvent?.count ?? 0 == 0{
          switch indexPath.section {
          case 0:
            latestEventCell.loadEventData(event: (viewModel.latestEvent?[indexPath.row])!)
            return latestEventCell
          default:
            teamCell.loadTeamData(team: (viewModel.teams?[indexPath.row])!)
            return teamCell
          }
        } else {
          switch indexPath.section {
          case 0:
            upComingEventCell.loadEventData(event: (viewModel.upcomingEvent?[indexPath.row])!)
            return upComingEventCell
          case 1:
            latestEventCell.loadEventData(event: (viewModel.latestEvent?[indexPath.row])!)
            return latestEventCell
          default:
            teamCell.loadTeamData(team: (viewModel.teams?[indexPath.row])!)
            return teamCell
          }
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
      var numberOfSections = 3

      if viewModel.upcomingEvent?.count ?? 0 == 0{
        numberOfSections = 2
      }
      return numberOfSections
    }
    
    
    
    func checkFav(){
      viewModel.isFavourite(leagueId: leagueId)
      changeFavouriteIcon()
    }
    
    func bindDataBase(){
      viewModel.resultDBToViewController = { [weak self] in
          self?.changeFavouriteIcon()
      }
    }
    
    func changeFavouriteIcon(){
        if (self.viewModel.isFavourite) {
            favBtnApperance.isSelected = true
            favBtnApperance.setImage(UIImage(systemName: "star.fill"), for: .selected)

        }else if (self.viewModel.isFavourite == false){
            favBtnApperance.isSelected = false
            favBtnApperance.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    @IBAction func favouriteBtn(_ sender: UIButton) {
        let favLeague = LeagueLocal(sport: self.sportName, name: leagueName, logo: leagueLogo, key: leagueId)
        viewModel.isFavourite(leagueId: leagueId)

        if self.viewModel.isFavourite{
            deleteFav()
          
        } else {
            viewModel.insertFavouriteLeague(league: favLeague)
            showProgress(message: "Added To Favourite")
        }
    }
    
    func deleteFav(){
        let alert : UIAlertController = UIAlertController(title: "Confirm to delete", message: "Are you sure you want to delete this movie?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
            self.viewModel.isFavourite = false
            self.showProgress(message: "Deleted")
            self.viewModel.deleteFavLeague(key: self.leagueId)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel , handler: { action in
            self.viewModel.isFavourite = true
        }))
        self.present(alert, animated: true)
        
    }
    
    func showProgress(message : String){
        let hud = JGProgressHUD()
        hud.indicatorView = JGProgressHUDSuccessIndicatorView()
        hud.textLabel.text = message
        hud.square = true
        hud.style = .dark
        hud.show(in: view)
        hud.dismiss(afterDelay: 1, animated: true){
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

//        let teamDetails = viewModel.teams?[indexPath.row]
//        if let cell = collectionView.cellForItem(at: indexPath) as? TeamCell {
//            if let teamDetailsVC = UIStoryboard(name: "SecondStoryboard", bundle:nil ).instantiateViewController(withIdentifier: "TeamDetailsViewController") as? TeamDetailsViewController{
//                teamDetailsVC.teamId = teamDetails?.team_key ?? 0000
//                teamDetailsVC.sportName = self.sportName
//                present(teamDetailsVC,animated: true, completion: nil)
//            }
//                
//            
//        }
//        

    //}

    

        if (viewModel.upcomingEvent?.count ?? 0 == 0 && indexPath.section == 1) || (viewModel.upcomingEvent?.count ?? 0 != 0 && indexPath.section == 2){
        let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        let teamDetailsVC = storyboard.instantiateViewController(identifier: "TeamDetailsViewController") as! TeamDetailsViewController
            teamDetailsVC.teamId = viewModel.teams?[indexPath.row].team_key ?? 0000
            teamDetailsVC.sportName = self.sportName
        self.present(teamDetailsVC, animated: true)
      }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as? CustomHeaderView {
                
                if self.viewModel.upcomingEvent?.count ?? 0 == 0{
                    switch indexPath.section {
                    case 0:
                        header.titleLabel.text = "Latest Results"
                    default:
                        header.titleLabel.text = "Teams"
                    }
                } else {
                    switch indexPath.section {
                    case 0:
                        header.titleLabel.text = "Upcoming Events"
                    case 1:
                        header.titleLabel.text = "Latest Results"
                    default:
                        header.titleLabel.text = "Teams"
                        
                    }
                }
                return header
            }
            
        }
        return UICollectionReusableView()
    }
    
//     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//            if kind == UICollectionView.elementKindSectionHeader {
//                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! CustomHeaderView
//                
//                switch indexPath.section {
//                case 0:
//                    header.titleLabel.text = "Upcoming Events"
//                case 1:
//                    header.titleLabel.text = "Latest Results"
//                case 2:
//                    header.titleLabel.text = "Teams"
//                default:
//                    header.titleLabel.text = "Section"
//                }
//                
//                return header
//            }
//            return UICollectionReusableView()
//        }
}

