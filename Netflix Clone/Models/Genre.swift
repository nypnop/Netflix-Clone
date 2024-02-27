//
//  Genre.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 06/03/24.
//

import Foundation

struct GenresResponse: Codable {
    let genres:[Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String?
}
