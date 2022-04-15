//
//  NewsModel.swift
//  GetYourNews
//
//  Created by Anmol  Jandaur on 3/18/22.
//

import Foundation


struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct NewsContainer: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
