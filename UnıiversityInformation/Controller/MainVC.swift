//
//  MainVC.swift
//  UnıiversityInformation
//
//  Created by Enes Sancar on 8.05.2023.
//

import UIKit

class MainVC: UITableViewController {
    
    //MARK: - Properties
    var viewModel = MainViewModel()
    var dataResult: [University] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        setup()
        configureNavigation()
    }
}

//MARK: - Helpers
extension MainVC {
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureNavigation() {
        self.navigationItem.title = "University"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setup() {
        configureView()
        registerTableView()
        
        viewModel.getData { [weak self] result in
            guard let self = self else {
                return
            }
            guard let resultData = result else {
                return
            }
            self.dataResult = resultData
        }
    }
}

