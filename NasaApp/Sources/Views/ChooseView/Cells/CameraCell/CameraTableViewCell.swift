//
//  CameraCollectionViewCell.swift
//  NasaApp
//
//  Created by Doston Rustamov on 13/07/22.
//
import UIKit
import Combine

class CameraTableViewCell: BaseChooseTableViewCell {
    
    static let identifier = "CAMERA_CELL_ID"
    
    let selectedCamera = PassthroughSubject<Rover.CameraType, Never>()
    
    lazy var cameraPicker: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.inputView = pickerView
        return textField
    }()
    
    private let pickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dropdown")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func configureCell() {
        super.configureCell()
        
        placeIcon()
        placeCameraPicker()
    }
    
    
    private func placeCameraPicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        cellView.addSubview(cameraPicker)
        
        NSLayoutConstraint.activate([
            cameraPicker.topAnchor.constraint(equalTo: cellView.topAnchor),
            cameraPicker.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            cameraPicker.leftAnchor.constraint(equalTo: cellView.leftAnchor,constant: 10),
            cameraPicker.rightAnchor.constraint(equalTo: icon.leftAnchor,constant: -10)
        ])
    }
    
    
    private func placeIcon() {
        cellView.addSubview(icon)
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: cellView.topAnchor),
            icon.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            icon.rightAnchor.constraint(equalTo: cellView.rightAnchor,constant: -10),
            icon.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}




