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
            cell.currentCamera.handleEvents(receiveOutput: { [unowned self] newCamera in
                camera = newCamera
            })
            .sink { _ in }
            .store(in: &subsriptions)
            cell.setupCell()
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.identifier, for: indexPath) as! DateTableViewCell
            cell.currentDate.handleEvents(receiveOutput: { [unowned self] newDate in
                date = newDate
            })
            .sink { _ in }
            .store(in: &subsriptions)
            cell.setupCell()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
            cell.setupCell()
            return cell
        }
    }
    
    @objc func exploreButtonTapped() {
        guard
            let camera = camera,
            let date = date else {
            showErorrMessage(with: "Please fill all the fields")
            return
        }
        
        RoverNetworkManager.instance.fetchImages(from: camera, at: date) { [weak self] result in
            switch result {
            case .failure:
                self?.showErorrMessage(with: "Back-end error")
            case .success(let photos):
                self?.pushPhotosController(with: photos)
            }
        }
    }
    
    private func pushPhotosController(with photos: [Rover.Photo]) {
        let photosViewController = PhotosViewController()
        photosViewController.photos = photos
        photosViewController.setTitle(title: camera!.rawValue, subtitle: date!)
        navigationController?.pushViewController(photosViewController, animated: true)
        
    }
    
    private func showErorrMessage(with text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}
