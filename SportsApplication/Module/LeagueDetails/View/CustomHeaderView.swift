//
//  CustomHeaderView.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 26/05/2024.
//

import UIKit

class CustomHeaderView: UICollectionReusableView {
    
    let titleLabel = UILabel()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
        }

        private func setupViews() {
            
            titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        }
    
        
}
