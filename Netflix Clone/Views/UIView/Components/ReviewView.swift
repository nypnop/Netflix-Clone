//
//  RatingView.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 07/03/24.
//

import UIKit

class ReviewView: UIView {

    let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reviewCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray5
        collectionView.collectionViewLayout = layout
        collectionView.layer.cornerRadius = 10
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray5
        
        addSubview(label)
        addSubview(reviewCollectionView)
        
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContraints() {
        
        let labelConstraints = [
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ]
        
        
        let reviewCollectionViewConstraints = [
            reviewCollectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5),
            reviewCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            reviewCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            reviewCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(reviewCollectionViewConstraints)
        
    }

}
