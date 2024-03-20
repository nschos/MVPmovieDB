//
//  MovieTableViewCell.swift
//  MVPmoviewDB
//
//  Created by Luana Tais Thomas on 20/03/24.
//

import Foundation
import UIKit

class MovieTableViewCell: UITableViewCell {
    // Custom identifier
    static let identifier = "MovieTableViewCellIdentifier"
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let overviewLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    func setupCell() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
