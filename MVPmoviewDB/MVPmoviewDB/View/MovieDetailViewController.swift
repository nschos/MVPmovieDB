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
        self.navigationItem.title = "Details"
        navigationItem.largeTitleDisplayMode = .never
        self.setupUI(indexPath: indexPath)
    }
}

extension MovieDetailViewController {
    func setupUI(indexPath: IndexPath) {
        let movieDetailViewControllerModel = presenter.makeMovieDetailViewControllerModel(indexPath: indexPath, for: indexPath.row, section: indexPath.section)
        
        let image: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10
            return imageView
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.numberOfLines = 1
            return label
        }()
        
        let overviewLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            label.numberOfLines = 0
            label.textColor = .gray
            return label
        }()
        
        let tagsLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 13)
            label.numberOfLines = 3
            label.textColor = .gray
            return label
        }()
        
        let voteAverageLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .light)
            label.numberOfLines = 1
            label.textColor = .gray
            return label
        }()
        
        let overviewTitleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.numberOfLines = 1
            label.text = "Overview"
            return label
        }()
        
        image.image = UIImage(data: movieDetailViewControllerModel.imageCover ?? Data())
        titleLabel.text = movieDetailViewControllerModel.title
        overviewLabel.text = movieDetailViewControllerModel.overview
        tagsLabel.text = movieDetailViewControllerModel.tags
        voteAverageLabel.text = "✩ " + movieDetailViewControllerModel.voteAverage
        
        let headerVStack = UIStackView(arrangedSubviews: [titleLabel, tagsLabel, voteAverageLabel])
        headerVStack.axis = .vertical
        headerVStack.spacing = 16
        
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        tagsLabel.setContentHuggingPriority(.required, for: .vertical)
        voteAverageLabel.setContentHuggingPriority(.required, for: .vertical)
        
        let headerHStack = UIStackView(arrangedSubviews: [image, headerVStack])
        headerHStack.axis = .horizontal
        headerHStack.spacing = 16
        
        let contentVStack = UIStackView(arrangedSubviews: [headerHStack, overviewTitleLabel, overviewLabel])
        contentVStack.axis = .vertical
        contentVStack.spacing = 16
        
        view.addSubview(contentVStack)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        headerHStack.translatesAutoresizingMaskIntoConstraints = false
        contentVStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: headerHStack.leadingAnchor, constant: -32),
//            image.topAnchor.constraint(equalTo: headerHStack.topAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: headerVStack.leadingAnchor, constant: 16),
//            image.bottomAnchor.constraint(equalTo: headerHStack.bottomAnchor, constant: 16),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            contentVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentVStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            contentVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentVStack.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            headerHStack.leadingAnchor.constraint(equalTo: contentVStack.leadingAnchor),
            headerHStack.trailingAnchor.constraint(equalTo: contentVStack.trailingAnchor),
            headerHStack.topAnchor.constraint(equalTo: contentVStack.topAnchor),
            headerHStack.bottomAnchor.constraint(lessThanOrEqualTo: overviewTitleLabel.topAnchor, constant: -16),
            headerHStack.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            headerVStack.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            headerVStack.trailingAnchor.constraint(equalTo: contentVStack.trailingAnchor),
            headerVStack.topAnchor.constraint(equalTo: headerHStack.topAnchor),
            headerVStack.bottomAnchor.constraint(lessThanOrEqualTo: headerHStack.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            overviewTitleLabel.leadingAnchor.constraint(equalTo: contentVStack.leadingAnchor),
            overviewTitleLabel.trailingAnchor.constraint(equalTo: contentVStack.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            overviewLabel.leadingAnchor.constraint(equalTo: contentVStack.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: contentVStack.trailingAnchor),
            overviewLabel.bottomAnchor.constraint(equalTo: contentVStack.bottomAnchor)
        ])
        
        //        headerVStack.translatesAutoresizingMaskIntoConstraints = false
        //        headerVStack.leadingAnchor.constraint(equalTo: headerHStack.leadingAnchor, constant: 16).isActive = true
        //        headerVStack.topAnchor.constraint(equalTo: headerHStack.topAnchor, constant: 16).isActive = true
        //        headerVStack.trailingAnchor.constraint(equalTo: headerHStack.trailingAnchor, constant: -16).isActive = true
        //        headerVStack.bottomAnchor.constraint(lessThanOrEqualTo: headerHStack.bottomAnchor, constant: -16).isActive = true
        //
        //        headerHStack.translatesAutoresizingMaskIntoConstraints = false
        //        headerHStack.leadingAnchor.constraint(equalTo: contentVStack.leadingAnchor, constant: 16).isActive = true
        //        headerHStack.topAnchor.constraint(equalTo: contentVStack.topAnchor, constant: 16).isActive = true
        //        headerHStack.trailingAnchor.constraint(equalTo: contentVStack.trailingAnchor, constant: -16).isActive = true
        //        headerHStack.bottomAnchor.constraint(lessThanOrEqualTo: contentVStack.bottomAnchor, constant: -16).isActive = true
        //
        //        contentVStack.translatesAutoresizingMaskIntoConstraints = false
        //        contentVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        //        contentVStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        //        contentVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        //        contentVStack.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16).isActive = true
        //
        //        image.setContentHuggingPriority(.required, for: .horizontal)
        //        contentVStack.setContentHuggingPriority(.required, for: .horizontal)
        //
        //        image.translatesAutoresizingMaskIntoConstraints = false
        //        image.leadingAnchor.constraint(equalTo: headerHStack.leadingAnchor, constant: 16).isActive = true
        //        image.topAnchor.constraint(equalTo: headerHStack.topAnchor, constant: 16).isActive = true
        //        image.trailingAnchor.constraint(equalTo: headerVStack.leadingAnchor, constant: -16).isActive = true
        //        image.bottomAnchor.constraint(lessThanOrEqualTo: headerHStack.bottomAnchor, constant: -16).isActive = true
        //        image.widthAnchor.constraint(equalToConstant: 124).isActive = true // Adjust width as needed
        
    }
}

private extension MoviePresenter {
    typealias MovieDetailViewControllerModel = (title: String, overview: String, voteAverage: String, imageCover: Data?, tags: String)
    
    func makeMovieDetailViewControllerModel(indexPath: IndexPath, for index: Int, section: Int) -> MovieDetailViewControllerModel {
        let title = getTitleLabel(indexOf: index, section: section)
        let overview = getOverviewLabel(indexOf: index, section: section)
        let voteAverage = getVoteAverageLabel(indexOf: index, section: section)
        let imageCover = getImage(indexPath: indexPath, indexOf: index, section: section)
        let tags = getTags(indexOf: index, section: section)
        
        let movieDetailViewControllerModel = MovieDetailViewControllerModel(title: title,
                                                                            overview: overview,
                                                                            voteAverage: voteAverage,
                                                                            imageCover: imageCover,
                                                                            tags: tags)
        
        return movieDetailViewControllerModel
    }
}


