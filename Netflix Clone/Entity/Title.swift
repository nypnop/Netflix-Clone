//
//  Movie.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 29/02/24.
//

import Foundation

struct TrendingTitlesResponse: Codable {
    let results:[Title]
}

struct Title: Codable {
    let backdrop_path: String?
    let id: Int
    let name: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

/*
 "results": [
     {
       "adult": false,
       "backdrop_path": "/4woSOUD0equAYzvwhWBHIJDCM88.jpg",
       "genre_ids": [
         28,
         27,
         53
       ],
       "id": 1096197,
       "original_language": "en",
       "original_title": "No Way Up",
       "overview": "Characters from different backgrounds are thrown together when the plane they're travelling on crashes into the Pacific Ocean. A nightmare fight for survival ensues with the air supply running out and dangers creeping in from all sides.",
       "popularity": 1764.788,
       "poster_path": "/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg",
       "release_date": "2024-01-18",
       "title": "No Way Up",
       "video": false,
       "vote_average": 5.839,
       "vote_count": 115
     },
 */
