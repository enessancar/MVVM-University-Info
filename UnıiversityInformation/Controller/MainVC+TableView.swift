//
//  MainVC+TableVieww.swift
//  UnıiversityInformation
//
//  Created by Enes Sancar on 8.05.2023.
//

import UIKit

extension MainVC {
    
    func registerTableView() {
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as? MainCell else {
            fatalError()
        }
        cell.viewModel = viewModel.createMainCellViewModel(model: self.dataResult[indexPath.row])
        return cell   
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
