//
//  Review.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 06/03/24.
//

import Foundation

struct ReviewsResponse: Codable {
    let results:[Reviews]
}

struct Author: Codable {
    let name: String?
    let username: String?
    let avatar_path: String?
    let rating: Double?
}

struct Reviews: Codable {
    let author: String?
    let author_details: Author
    let content: String?
    let created_at: String?
    let updated_at: String?
}

/**
 "results": [
     {
       "author": "Manuel São Bento",
       "author_details": {
         "name": "Manuel São Bento",
         "username": "msbreviews",
         "avatar_path": null,
         "rating": 8
       },
       "content": "FULL SPOILER-FREE REVIEW @ https://talkingfilms.net/argylle-review-a-delightful-surprise-of-campy-entertainment/\r\n\r\n\"Argylle emerges as a (very) pleasant surprise this new year, blending absurdity with sophistication to create a truly memorable cinematic experience.\r\n\r\nMatthew Vaughn's vision, combined with Jason Fuchs' sharp, clever screenplay, provides an entertainment rollercoaster ride that obliterates initial expectations. From unexpected twists and turns to the incredibly charismatic cast, not to mention a third act filled with hilariously unforgettable action set pieces, the complex-made-simple spy story captivates the audience with its campy charm and relentless energy.\r\n\r\nIt's my first big recommendation of 2024, one you can't afford to miss in theaters!\"\r\n\r\nRating: A-",
       "created_at": "2024-01-31T17:01:02.175Z",
       "id": "65ba7cceb7d3520180224f2f",
       "updated_at": "2024-01-31T17:01:02.281Z",
       "url": "https://www.themoviedb.org/review/65ba7cceb7d3520180224f2f"
     },
 */
