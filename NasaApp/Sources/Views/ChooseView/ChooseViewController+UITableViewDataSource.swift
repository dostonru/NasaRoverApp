//
//  ChooseViewController+UITableViewDataSource.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import UIKit

extension ChooseViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Rover Camera"
        case 1:
            return "Date"
        default:
            return " "
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CameraTableViewCell.identifier, for: indexPath) as! CameraTableViewCell
            cell.selectedCamera.handleEvents(receiveOutput: { [unowned self] newCamera in
                camera = newCamera
            })
            .sink { _ in }
            .store(in: &subsriptions)
            cell.configureCell()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as! DateTableViewCell
            cell.selectDate.handleEvents(receiveOutput: { [unowned self] newDate in
                date = newDate
            })
            .sink { _ in }
            .store(in: &subsriptions)
            cell.configureCell()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
            cell.configureCell()
            return cell
        }
    }
}
