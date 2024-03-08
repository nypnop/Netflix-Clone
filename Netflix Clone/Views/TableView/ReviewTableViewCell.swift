//
//  ReviewTableViewCell.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 08/03/24.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    static let identifier = "ReviewTableViewCell"
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 9)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray3
  
        contentView.addSubview(authorLabel)
        contentView.addSubview(contentLabel)
        
        
//        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
