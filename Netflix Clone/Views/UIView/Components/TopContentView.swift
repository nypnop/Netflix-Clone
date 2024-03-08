//
//  TopContentView.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 07/03/24.
//

import UIKit
import WebKit

class TopContentView: UIView {

    let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
//    let webView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleToFill
//        return imageView
//    }()

    let infoAboveTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = UIColor(named: "goldColor")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textAlignment = .right
        label.textColor = .red
        label.text = "9.5"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let outOfTenLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.text = "/10"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let voteCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11)
        label.textColor = .gray
        label.text = "1000"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        webView.frame = bounds
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(webView)
        addSubview(infoAboveTitleLabel)
        addSubview(titleLabel)
        addSubview(ratingImageView)
        addSubview(ratingLabel)
        addSubview(outOfTenLabel)
        addSubview(voteCountLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
    
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let infoAboveTtileLabelConstraints = [
            infoAboveTitleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 10),
            infoAboveTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 30),
        ]
        
        let ratingImageViewConstraints = [
            ratingImageView.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 10),
            ratingImageView.trailingAnchor.constraint(equalTo: webView.trailingAnchor, constant: -20),
            ratingImageView.heightAnchor.constraint(equalToConstant: 30),
            ratingImageView.widthAnchor.constraint(equalToConstant: 30),
            ratingImageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20)
        ]
        let ratingLabelConstraints = [
            ratingLabel.topAnchor.constraint(equalTo: ratingImageView.bottomAnchor, constant: -7),
            ratingLabel.centerXAnchor.constraint(equalTo: ratingImageView.centerXAnchor, constant: -12),
            ratingLabel.widthAnchor.constraint(equalToConstant: 33),
            ratingLabel.heightAnchor.constraint(equalToConstant: 33)
        ]
        
        let outofTenLabelConstraints = [
            outOfTenLabel.topAnchor.constraint(equalTo: ratingImageView.bottomAnchor),
            outOfTenLabel.centerXAnchor.constraint(equalTo: ratingImageView.centerXAnchor, constant: 15),
            outOfTenLabel.widthAnchor.constraint(equalToConstant: 20),
            outOfTenLabel.heightAnchor.constraint(equalToConstant: 20)
        ]

        let voteCountLabelConstraints = [
            voteCountLabel.topAnchor.constraint(equalTo: outOfTenLabel.bottomAnchor, constant: -5),
            voteCountLabel.centerXAnchor.constraint(equalTo: ratingImageView.centerXAnchor),
            voteCountLabel.heightAnchor.constraint(equalToConstant: 20),
            voteCountLabel.widthAnchor.constraint(equalToConstant: 70)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(infoAboveTtileLabelConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(ratingImageViewConstraints)
        NSLayoutConstraint.activate(ratingLabelConstraints)
        NSLayoutConstraint.activate(outofTenLabelConstraints)
        NSLayoutConstraint.activate(voteCountLabelConstraints)
    }
}
