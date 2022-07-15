//
//  ButtonCollectionViewCell.swift
//  NasaApp
//
//  Created by Doston Rustamov on 13/07/22.
//

import UIKit

class ButtonTableViewCell: BaseChooseTableViewCell {
    
    static var identifier = "BUTTON_CELL_ID"
    
    var photos = [Rover.Photo]()
    
    private let exploreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.setTitle("Explore", for: .normal)
        return button
    }()
    
    override func setupCell() {
        super.setupCell()
        
        placeLabel()
    }
    
    private func placeLabel() {
        cellView.addSubview(exploreButton)
        
        NSLayoutConstraint.activate([
            exploreButton.topAnchor.constraint(equalTo: cellView.topAnchor),
            exploreButton.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            exploreButton.leftAnchor.constraint(equalTo: cellView.leftAnchor),
            exploreButton.rightAnchor.constraint(equalTo: cellView.rightAnchor)
        ])
        
        exploreButton.addTarget(nil, action: #selector(ChooseViewController.exploreButtonTapped), for: .touchUpInside)
    }
    
    
    
    private func showErorrMessage() {
        
    }
}
