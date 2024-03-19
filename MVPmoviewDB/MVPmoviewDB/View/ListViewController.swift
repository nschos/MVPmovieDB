//
//  ListViewController.swift
//  MVPmoviewDB
//
//  Created by Luana Tais Thomas on 19/03/24.
//

import Foundation
import UIKit


class ListViewController: UIViewController {
    private var presenter: MoviePresenter
    var tableView: UITableView
    var searchController: UISearchController
    
    init(presenter: MoviePresenter = MoviePresenter()) {
        self.presenter = presenter
        self.tableView = UITableView()
        self.searchController = UISearchController()
        
        super.init(nibName: nil, bundle: nil)
        
        presenter.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidLoad()
        
        self.title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupSearchController()
    }
    
    func setupSearchController() {
    searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Movies"
    navigationItem.searchController = searchController
    definesPresentationContext = true
    }
    
}
//
//extension ListViewController: UITableViewDelegate {
//    
//}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        tableView.reloadData()
    }
    
}

//extension ListViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//    
//    
//}

extension ListViewController: MoviePresenterDelegate {
    func updateUI() {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "hahaha"
       label.textAlignment = .center
       
       self.view.addSubview(label)
       
       NSLayoutConstraint.activate([
           label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
           label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
       ])
   }
}

