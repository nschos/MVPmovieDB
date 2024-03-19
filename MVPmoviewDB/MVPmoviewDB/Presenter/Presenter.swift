//
//  Presenter.swift
//  MVPmoviewDB
//
//  Created by Luana Tais Thomas on 19/03/24.
//

import Foundation
import UIKit

protocol MoviePresenterDelegate: AnyObject {
    func updateUI()
}

class MoviePresenter {
    
    let repository: APIMovieRepository = APIMovieRepository.shared
    weak var delegate: MoviePresenterDelegate?

    func viewDidLoad() {
        if repository.moviesNowPlaying.isEmpty {
            repository.fetchMoviesNowPlaying { isFinished in
                DispatchQueue.main.async {
                    if isFinished {
                        self.delegate?.updateUI()
                    }
                }
            }
        }
        
        if repository.moviesPopular.isEmpty {
            repository.fetchMoviesPopular { isFinished in
                DispatchQueue.main.async {
                    if isFinished {
                        self.delegate?.updateUI()
                    }
                }
            }
        }
    }
}
