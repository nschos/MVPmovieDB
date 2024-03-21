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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    // MARK: - Properties
    
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
    
    
    private func setupCell() {
        let verticalStackView = UIStackView(arrangedSubviews: [titleLabel, overviewLabel, voteAverageLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 16
        
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        overviewLabel.setContentHuggingPriority(.required, for: .vertical)
        voteAverageLabel.setContentHuggingPriority(.required, for: .vertical)
        
        let horizontalStackView = UIStackView(arrangedSubviews: [image, verticalStackView])
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 16
        contentView.addSubview(horizontalStackView)
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        horizontalStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16).isActive = true
        
        image.setContentHuggingPriority(.required, for: .horizontal)
        verticalStackView.setContentHuggingPriority(.required, for: .horizontal)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        image.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16).isActive = true
        image.widthAnchor.constraint(equalToConstant: 79).isActive = true // Adjust width as needed
        
    }
    
}
