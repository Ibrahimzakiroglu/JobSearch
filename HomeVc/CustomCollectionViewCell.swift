//
//  CustomCollectionViewCell.swift
//  Jobiz
//
//  Created by Developer on 24.06.24.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let companyLabel = UILabel()
    private let locationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        stackView.axis = .vertical
        stackView.spacing = 8
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(16)
        }
        
        imageView.image = UIImage(named: "job_icon")
        stackView.addArrangedSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        stackView.addArrangedSubview(titleLabel)
        
        companyLabel.font = UIFont.systemFont(ofSize: 14)
        stackView.addArrangedSubview(companyLabel)
        
        locationLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(locationLabel)
    }
    
    func configure(with job: Job) {
        titleLabel.text = job.title
        companyLabel.text = job.company
        locationLabel.text = job.location
    }
}

