//
//  YTSearchResponse.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 05/03/24.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
