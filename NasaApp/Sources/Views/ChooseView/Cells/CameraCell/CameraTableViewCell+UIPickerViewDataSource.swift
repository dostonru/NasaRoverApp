//
//  CameraTableViewCell+UIPickerViewDataSource.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import UIKit

extension CameraTableViewCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Rover.CameraType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Rover.CameraType.allCases[row].rawValue
    }
}
