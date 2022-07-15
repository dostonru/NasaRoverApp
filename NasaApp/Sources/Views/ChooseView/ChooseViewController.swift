//
//  ViewController.swift
//  NasaApp
//
//  Created by Doston Rustamov on 12/07/22.
//

import UIKit
import Combine

class ChooseViewController: UIViewController {
    
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private var chooseTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(CameraTableViewCell.self, forCellReuseIdentifier: CameraTableViewCell.identifier)
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.identifier)
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCell.identifier)
        return tableView
    }()
    
    let loadingIndicator = UIActivityIndicatorView(style: .large)
    
    var camera: Rover.CameraType?
    var date: String?
    var subsriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Select Camera and Date"
        
        placeImageView()
        placeTableView()
        placeLoadingIndicator()
    }
    
    
    private func placeImageView() {
        view.insertSubview(imageView, at: 0)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func placeTableView() {
        chooseTableView.delegate = self
        chooseTableView.dataSource = self
        
        view.addSubview(chooseTableView)

        NSLayoutConstraint.activate([
            chooseTableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 280),
            chooseTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            chooseTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            chooseTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func placeLoadingIndicator() {
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

