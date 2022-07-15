//
//  BaseChooseTableViewCell.swift
//  NasaApp
//
//  Created by Doston Rustamov on 14/07/22.
//

import UIKit

class BaseChooseTableViewCell: UITableViewCell {
    
    var cellView: UIView = {
        var cell = UIView()
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .white.withAlphaComponent(0.5)
        cell.clipsToBounds = true
        return cell
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell() {
        self.backgroundColor = .clear
        
        contentView.addSubview(cellView)
        NSLayoutConstraint.activate([
            cellView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 24),
            cellView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
