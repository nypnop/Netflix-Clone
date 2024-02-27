//
//  PreviewMovieView.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 07/03/24.
//

import UIKit


class PreviewMovieView: UIView {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
        
    }()
    let topContentView: TopContentView = {
        let topContentView = TopContentView()
        topContentView.translatesAutoresizingMaskIntoConstraints = false
        return topContentView

    }()

    let genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor(named: "mainColor")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let overviewLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.numberOfLines = 0
        label.layer.cornerRadius = 10
        label.font = .systemFont(ofSize: 14)
        label.layer.masksToBounds = true
        label.backgroundColor = .systemGray4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let reviewView: ReviewView = {
        let reviewView = ReviewView()
        reviewView.translatesAutoresizingMaskIntoConstraints = false
        return reviewView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(named: "mainColor")
        
        reviewView.label.text = "Review"
        
        contentView.addSubview(topContentView)
        contentView.addSubview(genreCollectionView)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(reviewView)
        
        scrollView.addSubview(contentView)
        addSubview(scrollView)
        
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ]
        
        let contentViewConstraints = [
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: reviewView.bottomAnchor)
        ]
        

        let topContentViewConstraints = [
            topContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topContentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topContentView.topAnchor.constraint(equalTo: topAnchor),
            topContentView.heightAnchor.constraint(equalToConstant: 400)
        ]

        
        let genreCollectionViewConstraints = [
            genreCollectionView.topAnchor.constraint(equalTo: topContentView.bottomAnchor, constant: 10),
            genreCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            genreCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            genreCollectionView.heightAnchor.constraint(equalToConstant:87)
        ]

        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: genreCollectionView.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20)
        ]
        
        let reviewViewConstraints = [
            reviewView.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 30),
            reviewView.widthAnchor.constraint(equalTo: widthAnchor),
            reviewView.heightAnchor.constraint(equalToConstant: 255)
        ]
        NSLayoutConstraint.activate(reviewViewConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(contentViewConstraints)
        NSLayoutConstraint.activate(topContentViewConstraints)
        NSLayoutConstraint.activate(genreCollectionViewConstraints)

    }
    
    
    
    

}
