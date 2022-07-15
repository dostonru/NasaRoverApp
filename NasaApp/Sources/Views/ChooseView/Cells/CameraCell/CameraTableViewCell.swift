//
//  CameraCollectionViewCell.swift
//  NasaApp
//
//  Created by Doston Rustamov on 13/07/22.
//
import UIKit
import Combine

class CameraTableViewCell: BaseChooseTableViewCell {
    
    static var identifier = "CAMERA_CELL_ID"
    
    var currentCamera = PassthroughSubject<Rover.CameraType, Never>()
    
    let cameraPicker: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func setupCell() {
        super.setupCell()
        
        placeIcon()
        placeCameraPicker()
    }
    
    private func placeCameraPicker() {
        cellView.addSubview(cameraPicker)
        
        NSLayoutConstraint.activate([
            cameraPicker.topAnchor.constraint(equalTo: cellView.topAnchor),
            cameraPicker.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            cameraPicker.leftAnchor.constraint(equalTo: cellView.leftAnchor,constant: 10),
            cameraPicker.rightAnchor.constraint(equalTo: icon.leftAnchor,constant: -10)
        ])
        
        pickerView.delegate = self
        pickerView.dataSource = self
        cameraPicker.inputView = pickerView
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




