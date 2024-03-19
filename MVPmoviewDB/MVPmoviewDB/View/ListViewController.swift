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
    
    init(presenter: MoviePresenter = MoviePresenter()) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        presenter.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        view.backgroundColor = .red
        
    }
}

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

