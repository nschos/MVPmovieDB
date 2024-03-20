//
//  Repository.swift
//  MVPmoviewDB
//
//  Created by Luana Tais Thomas on 19/03/24.
//

import Foundation
import UIKit

enum Endpoint: String, CaseIterable {
    case nowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=ed251172ec9ef37be6a2cc166f1ba10b&language=en-US&page=1"
    case popular = "https://api.themoviedb.org/3/movie/popular?api_key=ed251172ec9ef37be6a2cc166f1ba10b&language=en-US&page=1"
}

protocol MovieRepository {
    func fetchMovies(endpoint: Endpoint, completion: @escaping (Bool) -> Void)
    func getImage(urlPath: String, completionBlock: @escaping (UIImage?, String) -> Void)
}

class APIMovieRepository: MovieRepository {
    // Singleton - só consigo inicializar com o shared
    static let shared: APIMovieRepository = APIMovieRepository()
    private init(){}
    
    var moviesNowPlaying: [Movie] = []
    var moviesPopular: [Movie] = []
    
    func fetchMovies(endpoint: Endpoint, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: endpoint.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  error == nil,
                  let data = data
            else {
                print(error ?? "Erro tentando conectar com a API")
                return
            }
            
            guard let decoded = Self.decodeByProtocols(data: data) else {
                completion(false)
                return
            }
            
            if endpoint == .popular {
                self.moviesPopular = decoded.results
            } else {
                self.moviesNowPlaying = decoded.results
            }
            completion(true)
        }
        .resume()
    }

    
    func getImage(urlPath: String, completionBlock: @escaping (UIImage?, String) -> Void) {
        let urlString = "https://image.tmdb.org/t/p/w500\(urlPath)"
        guard let url = URL(string: urlString) else {
            completionBlock(nil, urlString)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  error == nil,
                  let data = data
            else {
                completionBlock(nil, urlPath)
                print(url)
                print(error ?? "error aqui")
                return
            }
            
            guard let image = UIImage(data: data) else {
                completionBlock(nil, urlPath)
                return
            }
            
            completionBlock(image, urlPath)
        }
        .resume()
    }
    
    static func decodeByProtocols(data: Data) -> MovieResponse? {
        do {
            let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            return decodedResponse
        } catch {
            print(error)
        }
        return nil
    }
    
    func getNumberOfSections() -> Int {
        return Endpoint.allCases.count
    }
    
    func getNumberOfMovies(endpoint: Endpoint) -> Int {
        return endpoint == .nowPlaying ? moviesNowPlaying.count : moviesPopular.count
    }
    
    func getTitleOfMovie(indexOf: Int, endpoint: Endpoint) -> String {
        return endpoint == .nowPlaying ? moviesNowPlaying[indexOf].title : moviesPopular[indexOf].title
    }
    
    func getDescriptionOfMovie(indexOf: Int, endpoint: Endpoint) -> String {
        return endpoint == .nowPlaying ? moviesNowPlaying[indexOf].description : moviesPopular[indexOf].description
    }
    
    func getOverviewOfMovie(indexOf: Int, endpoint: Endpoint) -> String {
        return endpoint == .nowPlaying ? moviesNowPlaying[indexOf].overview : moviesPopular[indexOf].overview
    }
    
    func getImageOfMovie(indexOf: Int, endpoint: Endpoint) -> Data? {
        return endpoint == .nowPlaying ? moviesNowPlaying[indexOf].imageCover : moviesPopular[indexOf].imageCover
    }
    
}
