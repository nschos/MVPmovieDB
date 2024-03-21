//
//  MovieDetailViewController.swift
//  MVPmoviewDB
//
//  Created by Luana Tais Thomas on 19/03/24.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    private var presenter: MoviePresenter
    var coordinator: CoordinatorFlowController?
    var indexPath: IndexPath
    
    init(presenter: MoviePresenter = MoviePresenter(), indexPath: IndexPath) {
        self.presenter = presenter
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidLoad()
        self.title = "Details"
        
        self.setupUI(indexPath: indexPath)
    }
}

extension MovieDetailViewController {
    func setupUI(indexPath: IndexPath) {
        let movieDetailViewControllerModel = presenter.makeMovieDetailViewControllerModel(indexPath: indexPath, for: indexPath.row, section: indexPath.section)
        print(movieDetailViewControllerModel.title)
        print(movieDetailViewControllerModel.overview)
        print(movieDetailViewControllerModel.voteAverage)
    }
}

private extension MoviePresenter {
    typealias MovieDetailViewControllerModel = (title: String, overview: String, voteAverage: String, imageCover: Data?)
    
    func makeMovieDetailViewControllerModel(indexPath: IndexPath, for index: Int, section: Int) -> MovieDetailViewControllerModel {
        let title = getTitleLabel(indexOf: index, section: section)
        let overview = getOverviewLabel(indexOf: index, section: section)
        let voteAverage = getVoteAverageLabel(indexOf: index, section: section)
        let imageCover = getImage(indexPath: indexPath, indexOf: index, section: section)
        
        let movieDetailViewControllerModel = MovieDetailViewControllerModel(title: title,
                                                              overview: overview,
                                                              voteAverage: voteAverage,
                                                              imageCover: imageCover)
        
        return movieDetailViewControllerModel
    }
}


