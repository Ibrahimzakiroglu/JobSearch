//
//  HomeViewController.swift
//  Jobiz
//
//  Created by Developer on 24.06.24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private let viewModel = JobViewModel()
    private var featuredJobsCollectionView: UICollectionView!
    private var recommendedJobsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
     
        let welcomeStackView = UIStackView()
        welcomeStackView.axis = .vertical
        welcomeStackView.spacing = 8
        view.addSubview(welcomeStackView)
        welcomeStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(28)
            make.left.equalTo(view).offset(24)
        }
        
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome Back!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 14)
        welcomeStackView.addArrangedSubview(welcomeLabel)
        
        let nameLabel = UILabel()
        nameLabel.text = "John Lucas 👋"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        welcomeStackView.addArrangedSubview(nameLabel)
        
      
        let profileButton = UIButton()
               profileButton.setImage(UIImage(named: "profilefoto"), for: .normal)
               profileButton.layer.cornerRadius = 22
               profileButton.clipsToBounds = true
               view.addSubview(profileButton)
               profileButton.snp.makeConstraints { make in
                   make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(23)
                   make.right.equalTo(view).offset(-19)
                   make.width.height.equalTo(44)
               }
               profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
               
        let searchStackView = UIStackView()
        searchStackView.axis = .horizontal
        searchStackView.spacing = 8
        searchStackView.layer.cornerRadius = 12
        view.addSubview(searchStackView)
        searchStackView.snp.makeConstraints { make in
            make.top.equalTo(welcomeStackView.snp.bottom).offset(20)
            make.left.equalTo(view).offset(24)
            make.right.equalTo(view).offset(-24)
            make.height.equalTo(48)
        }
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search a job or position"
        searchBar.layer.cornerRadius = 12
        searchBar.clipsToBounds = true
        searchStackView.addArrangedSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.width.equalTo(263)
            make.height.equalTo(48)
        }
        
        let filterView = UIView()
        filterView.backgroundColor = .lightGray
        filterView.layer.cornerRadius = 12
        searchStackView.addArrangedSubview(filterView)
        filterView.snp.makeConstraints { make in
            make.width.height.equalTo(48)
        }
        
        let filterImageView = UIImageView(image: UIImage(systemName: "filter"))
        filterImageView.contentMode = .center
        filterView.addSubview(filterImageView)
        filterImageView.snp.makeConstraints { make in
            make.center.equalTo(filterView)
            make.width.height.equalTo(26)
        }
        
      
        let featuredJobsLabel = UILabel()
        featuredJobsLabel.text = "Featured Jobs"
        featuredJobsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(featuredJobsLabel)
        featuredJobsLabel.snp.makeConstraints { make in
            make.top.equalTo(searchStackView.snp.bottom).offset(40)
            make.left.equalTo(view).offset(24)
        }
        
   
        let seeAllButton1 = UIButton(type: .system)
        seeAllButton1.setTitle("See all", for: .normal)
        view.addSubview(seeAllButton1)
        seeAllButton1.snp.makeConstraints { make in
            make.centerY.equalTo(featuredJobsLabel)
            make.right.equalTo(view).offset(-24)
            
        }
        
        
    
        let featuredJobsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        featuredJobsCollectionView.backgroundColor = .green
        featuredJobsCollectionView.dataSource = self
        view.addSubview(featuredJobsCollectionView)
        featuredJobsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(featuredJobsLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(24)
            make.right.equalTo(view).offset(-24)
            make.height.equalTo(280)
        }
        
      
        let recommendedJobsLabel = UILabel()
        recommendedJobsLabel.text = "Recommended Jobs"
        recommendedJobsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(recommendedJobsLabel)
        recommendedJobsLabel.snp.makeConstraints { make in
            make.top.equalTo(featuredJobsCollectionView.snp.bottom).offset(40)
            make.left.equalTo(view).offset(24)
        }
        
   
        let seeAllButton2 = UIButton(type: .system)
        seeAllButton2.setTitle("See all", for: .normal)
        view.addSubview(seeAllButton2)
        seeAllButton2.snp.makeConstraints { make in
            make.centerY.equalTo(recommendedJobsLabel)
            make.right.equalTo(view).offset(-24)
        }
        
    
        let recommendedJobsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        recommendedJobsCollectionView.backgroundColor = .clear
        recommendedJobsCollectionView.dataSource = self
        view.addSubview(recommendedJobsCollectionView)
        recommendedJobsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recommendedJobsLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(24)
            make.right.equalTo(view).offset(-24)
            make.height.equalTo(164)
        }
        
      
        configureCollectionView(featuredJobsCollectionView)
        configureCollectionView(recommendedJobsCollectionView)
    }
    
    private func configureCollectionView(_ collectionView: UICollectionView) {
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 186, height: 280)
        }
    }
    
     @objc private func profileButtonTapped() {
         let viewmodel = UserProfileViewModel(userProfile: .init(name: "", jobTitle: "", appliedCount: 1, reviewedCount: 1, interviewCount: 1, resumeDescription: "", portfolioImages: []))
         let profileVC = UserProfileViewController(viewModel: viewmodel)
         navigationController?.pushViewController(profileVC, animated: true)
     }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == featuredJobsCollectionView ? viewModel.numberOfFeaturedJobs : viewModel.numberOfRecommendedJobs
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        let job = collectionView == featuredJobsCollectionView ? viewModel.featuredJob(at: indexPath.row) : viewModel.recommendedJob(at: indexPath.row)
        cell.configure(with: job)
        return cell
    }
}

