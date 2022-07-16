//
//  CameraTableViewCell+UIPickerViewDelegate.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import UIKit

extension CameraTableViewCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCamera.send(Rover.CameraType.allCases[row])
        cameraPicker.text = Rover.CameraType.allCases[row].rawValue
        cameraPicker.resignFirstResponder()
    }
}
