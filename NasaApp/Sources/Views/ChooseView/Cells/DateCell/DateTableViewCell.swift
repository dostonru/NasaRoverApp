//
//  DateCollectionViewCell.swift
//  NasaApp
//
//  Created by Doston Rustamov on 13/07/22.
//

import UIKit
import Combine

class DateTableViewCell: BaseChooseTableViewCell {
    
    static var identifier = "DATE_CELL_ID"
    
    var currentDate = PassthroughSubject<String, Never>()
    
    private let dayPicker: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let pickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        return picker
    }()
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func setupCell() {
        super.setupCell()
        
        placeIcon()
        placeDatePicker()
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
    
    private func placeDatePicker() {
        cellView.addSubview(dayPicker)
        
        NSLayoutConstraint.activate([
            dayPicker.topAnchor.constraint(equalTo: cellView.topAnchor),
            dayPicker.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            dayPicker.leftAnchor.constraint(equalTo: cellView.leftAnchor,constant: 10),
            dayPicker.rightAnchor.constraint(equalTo: icon.leftAnchor,constant: -10)
        ])
        
        dayPicker.inputView = pickerView
        
        pickerView.addTarget(self, action: #selector(dateChoosed), for: .valueChanged)
    }
    
    @objc func dateChoosed() {
        // First we need to show in View
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, yyyy"
        
        // Second we need to format to send to the back-end
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        
        let dateForServer = dateFormatter2.string(from: pickerView.date)
        currentDate.send(dateForServer)
        
        dayPicker.text = dateFormatter.string(from: pickerView.date)
        dayPicker.resignFirstResponder()
    }

}
