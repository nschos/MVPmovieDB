//
//  Presenter.swift
//  MVPmoviewDB
//
//  Created by Luana Tais Thomas on 19/03/24.
//

import Foundation
import UIKit

protocol MoviePresenterDelegate: AnyObject {
    func setupUI()
}

extension Endpoint {
    init(section: Int) {
        switch section {
        case 0:
            self = .nowPlaying
        case 1:
            self = .popular
        default:
            self = .popular
        }
    }
    
    var name: String {
        switch self {
        case .nowPlaying:
            return "Now Playing"
        case .popular:
            return "Popular"
        }
    }
}

class MoviePresenter {
    
    let repository: APIMovieRepository = APIMovieRepository.shared
    weak var delegate: MoviePresenterDelegate?
    
    func viewDidLoad() {
        var finishedNowPlaying = false
        var finishedPopular = false
        
        if repository.moviesNowPlaying.isEmpty {
            repository.fetchMovies(endpoint: .nowPlaying) { isFinished in
                if isFinished {
                    finishedNowPlaying = true
                }
            }
        }
        
        if repository.moviesPopular.isEmpty {
            repository.fetchMovies(endpoint: .popular) { isFinished in
                if isFinished {
                    finishedPopular = true
                }
            }
        }
        
        DispatchQueue.main.async {
            if finishedPopular && finishedNowPlaying {
                self.delegate?.setupUI()
            }
        }
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        return repository.getNumberOfMovies(endpoint: Endpoint(section: section))
    }
    
    func getNumberOfSections() -> Int {
        return repository.getNumberOfSections()
    }
    
    func getSectionName(section: Int) -> String {
        return Endpoint(section: section).name
    }
    
    func getTitleLabel(indexOf: Int, section: Int) -> String {
        return repository.getTitleOfMovie(indexOf: indexOf, endpoint: Endpoint(section: section))
    }
    
    func getDescriptionLabel(indexOf: Int, section: Int) -> String {
        return repository.getDescriptionOfMovie(indexOf: indexOf, endpoint: Endpoint(section: section))
    }
    
    func getOverviewLabel(indexOf: Int, section: Int) -> String {
        return repository.getOverviewOfMovie(indexOf: indexOf, endpoint: Endpoint(section: section))
    }
    
    func getImage(indexOf: Int, section: Int) -> Data? {
        return repository.getImageOfMovie(indexOf: indexOf, endpoint: Endpoint(section: section))
    }
}
