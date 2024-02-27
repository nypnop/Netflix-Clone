//
//  ReviewCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 08/03/24.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    static let identifier = "ReviewCollectionViewCell"
    
    
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
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 3
        clipsToBounds = true
        
        backgroundColor = .systemGray3
  
        addSubview(authorLabel)
        addSubview(contentLabel)
        addSubview(dateLabel)
        
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConstraints() {
        
        let authorLabelConstraints = [
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            authorLabel.topAnchor.constraint(equalTo: topAnchor)
        ]
        
        let contentLabelConstraints = [
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor)
        ]
        
        let dateLabelConstraints = [
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dateLabel.topAnchor.constraint(equalTo: topAnchor)
        ]
        
        NSLayoutConstraint.activate(authorLabelConstraints)
        NSLayoutConstraint.activate(contentLabelConstraints)
        NSLayoutConstraint.activate(dateLabelConstraints)
//        imageView.snp.makeConstraints { make in
//            make.top.leading.trailing.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.7)
//        }
//        
//        defaultImageView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(50)
//        }
//        
//        mainTextLabel.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(5)
//            make.leading.equalToSuperview().offset(2)
//            make.trailing.equalToSuperview().offset(-2)
//        }
//        
//        subTextLabel.snp.makeConstraints { make in
//            make.top.equalTo(mainTextLabel.snp.bottom).offset(2)
//            make.leading.equalToSuperview().offset(2)
//            make.trailing.equalToSuperview().offset(-2)
//        }
        
    }
}
