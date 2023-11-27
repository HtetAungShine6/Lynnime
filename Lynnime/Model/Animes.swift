//
//  Animes.swift
//  Lynnime
//
//  Created by Akito Daiki on 14/11/2566 BE.
//

import Foundation

struct Anime: Decodable, Identifiable, Hashable {
    let id = UUID()
    let title: String
    let synopsis: String
    let genre: String
//    let aired: String?
//    let episodes: Int?
    let members: Int
    let popularity: Int
    let ranked: Int
    let score: Double
    let img_url: String
    let link: String
    
//    init(id: Int, title: String, synopsis: String, genre: String, members: Int, popularity: Int, ranked: Int, score: Double,  img_url: String, link: String) {
//        self.id = id
//        self.title = title
//        self.synopsis = synopsis
//        self.genre = genre
//        self.members = members
//        self.popularity = popularity
//        self.ranked = ranked
//        self.score = score
//        self.img_url = img_url
//        self.link = link
//    }
}
