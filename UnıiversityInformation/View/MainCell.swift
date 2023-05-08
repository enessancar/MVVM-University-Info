//
//  MainCell.swift
//  UnıiversityInformation
//
//  Created by Enes Sancar on 8.05.2023.
//

import UIKit

class MainCell: UITableViewCell {
    static let identifier = "MainCell"
    
    //MARK: - Properties
    var viewModel: MainCellViewModel? {
        didSet {
            configure()
        }
    }
    
    private let universityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fırat")
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let universityName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private var stackView: UIStackView!
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Helpers
extension MainCell {
    private func setup() {
        stackView = UIStackView(arrangedSubviews: [universityImageView, universityName])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    private func configure() {
        guard let viewModel = self.viewModel else {
            return
        }
        universityName.text = viewModel.name
    }
}
