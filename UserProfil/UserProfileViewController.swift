//
//  UserProfileViewController.swift
//  Jobiz
//
//  Created by Developer on 25.06.24.
//
import UIKit
import SnapKit

class UserProfileViewController: UIViewController {
    private var viewModel: UserProfileViewModel!
   

    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let jobTitleLabel = UILabel()
    private let appliedCountLabel = UILabel()
    private let reviewedCountLabel = UILabel()
    private let interviewCountLabel = UILabel()
    private let resumeButton = UIButton()
    private let portfolioCollectionView: UICollectionView

    init(viewModel: UserProfileViewModel) {
        self.viewModel = viewModel
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.portfolioCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
    }
    
    private func setupUI() {
        view.backgroundColor = .white

   
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
       
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
 
        jobTitleLabel.font = UIFont.systemFont(ofSize: 18)
        jobTitleLabel.textColor = .gray
        jobTitleLabel.textAlignment = .center
        view.addSubview(jobTitleLabel)
        jobTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
 
        let statsStackView = UIStackView(arrangedSubviews: [appliedCountLabel, reviewedCountLabel, interviewCountLabel])
        statsStackView.axis = .horizontal
        statsStackView.distribution = .fillEqually
        view.addSubview(statsStackView)
        statsStackView.snp.makeConstraints { make in
            make.top.equalTo(jobTitleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
        }

       
        resumeButton.setTitle("Make a resume", for: .normal)
        resumeButton.setTitleColor(.blue, for: .normal)
        view.addSubview(resumeButton)
        resumeButton.snp.makeConstraints { make in
            make.top.equalTo(statsStackView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
        }
        resumeButton.addTarget(self, action: #selector(didTapResumeButton), for: .touchUpInside)

      
        portfolioCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PortfolioCell")
        portfolioCollectionView.dataSource = self
        view.addSubview(portfolioCollectionView)
        portfolioCollectionView.snp.makeConstraints { make in
            make.top.equalTo(resumeButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(200)
        }
    }
    
    private func bindViewModel() {
        nameLabel.text = viewModel.name
        jobTitleLabel.text = viewModel.jobTitle
        appliedCountLabel.text = viewModel.appliedCount
        reviewedCountLabel.text = viewModel.reviewedCount
        interviewCountLabel.text = viewModel.interviewCount
    }
    
    @objc private func didTapResumeButton() {
     
    }
}


extension UserProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.portfolioImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PortfolioCell", for: indexPath)
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        cell.contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
      
        return cell
    }
}
