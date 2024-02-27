//
//  Movie.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 06/03/24.
//

import Foundation

struct MovieResponse: Codable {
    let backdrop_path: String?
    let genres: [Genre]
    let id: Int
    let original_name: String?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let vote_average: Float
    let vote_count: Int
    let runtime: Int?
}

/*
 "adult": false,
   "backdrop_path": "/ln2Gre4IYRhpjuGVybbtaF4CLo5.jpg",
   "belongs_to_collection": null,
   "budget": 165000000,
   "genres": [
     {
       "id": 12,
       "name": "Adventure"
     },
     {
       "id": 18,
       "name": "Drama"
     },
     {
       "id": 878,
       "name": "Science Fiction"
     }
   ],
   "homepage": "http://www.interstellarmovie.net/",
   "id": 157336,
   "imdb_id": "tt0816692",
   "original_language": "en",
   "original_title": "Interstellar",
   "overview": "The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.",
   "popularity": 139.727,
   "poster_path": "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
   "production_companies": [
     {
       "id": 923,
       "logo_path": "/8M99Dkt23MjQMTTWukq4m5XsEuo.png",
       "name": "Legendary Pictures",
       "origin_country": "US"
     },
     {
       "id": 9996,
       "logo_path": "/3tvBqYsBhxWeHlu62SIJ1el93O7.png",
       "name": "Syncopy",
       "origin_country": "GB"
     },
     {
       "id": 13769,
       "logo_path": null,
       "name": "Lynda Obst Productions",
       "origin_country": ""
     }
   ],
   "production_countries": [
     {
       "iso_3166_1": "GB",
       "name": "United Kingdom"
     },
     {
       "iso_3166_1": "US",
       "name": "United States of America"
     }
   ],
   "release_date": "2014-11-05",
   "revenue": 701729206,
   "runtime": 169,
   "spoken_languages": [
     {
       "english_name": "English",
       "iso_639_1": "en",
       "name": "English"
     }
   ],
   "status": "Released",
   "tagline": "Mankind was born on Earth. It was never meant to die here.",
   "title": "Interstellar",
   "video": false,
   "vote_average": 8.429,
   "vote_count": 33789
 */
