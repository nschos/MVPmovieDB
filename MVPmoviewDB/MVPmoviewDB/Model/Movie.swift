//
//  Movie.swift
//  MVPmoviewDB
//
//  Created by Luana Tais Thomas on 19/03/24.
//

import Foundation
import UIKit

struct MovieResponse: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {

    var id: Int
    var title: String
    var overview: String
    var voteAverage: Double
    var posterPath: String

    var imageCover: Data?

    var description: String {
        return "\(self.id)" + " - " + self.title
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case imageCover
    }
}
