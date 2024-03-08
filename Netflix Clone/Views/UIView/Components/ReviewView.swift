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
    
    let reviewTable: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
//        table.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray5
        
        addSubview(label)
        addSubview(reviewTable)
        
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
            reviewTable.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            reviewTable.leadingAnchor.constraint(equalTo: superview?.leadingAnchor ?? leadingAnchor),
            reviewTable.trailingAnchor.constraint(equalTo: superview?.trailingAnchor ?? trailingAnchor),
            reviewTable.bottomAnchor.constraint(equalTo: superview?.bottomAnchor ?? bottomAnchor)

        ]
        
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(reviewCollectionViewConstraints)
        
    }

}
