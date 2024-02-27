//
//  GenreTableViewCell.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 08/03/24.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    static let identifier = "GenreTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        
//        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
//    func applyConstraints() {
//        
//    }

}
