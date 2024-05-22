//
//  LeagueDetailsController.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import UIKit

class LeagueDetailsController: UIViewController {
    
    var sportName:String = "football"
    var leagueId:Int = 3
    var dataCounter = 0
    var viewModel: LeagueDetailsViewModel!
    var indicator: UIActivityIndicatorView!

    @IBOutlet weak var detailsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let upcomingEventCell = UINib(nibName: "UpComingEventCell", bundle: nil)
        detailsCollectionView.register(upcomingEventCell, forCellWithReuseIdentifier: "UpComingEventCell")
          
        let latestEventCell = UINib(nibName: "LatestEventCell", bundle: nil)
        detailsCollectionView.register(latestEventCell, forCellWithReuseIdentifier: "LatestEventCell")

        let teamCell = UINib(nibName: "TeamCell", bundle: nil)
        detailsCollectionView.register(teamCell, forCellWithReuseIdentifier: "TeamCell")
        
        viewModel = LeagueDetailsViewModel()
        fetchLeagueData()
        setupLeagueData()
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
      return section
    }
    
    func drawTheBottomHorizontalSection() -> NSCollectionLayoutSection{
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(132), heightDimension: .absolute(158))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
      group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
      let section = NSCollectionLayoutSection(group: group)
      section.orthogonalScrollingBehavior = .continuous
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 0)
      section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
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
                  return self?.drawTheBottomHorizontalSection()
                }
              }else{
                switch index{
                case 0:
                  return self?.drawUpComingEventSection()
                case 1:
                  return self?.drawLatestEventSection()
                default:
                  return self?.drawTheBottomHorizontalSection()
                }
              }
            }
            self?.detailsCollectionView.setCollectionViewLayout(layout, animated: true)
          }
        }
      }
    }

    
}

