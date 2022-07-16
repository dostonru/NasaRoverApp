//
//  PhotoDetailViewController.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import UIKit
import AlamofireImage

class PhotoDetailViewController: UIViewController {
    
    var photo: Rover.Photo?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFit
        button.setImage(UIImage(named: "share"), for: .normal)
        return button
    }()
    
    private lazy var rightBarItem: UIBarButtonItem = {
        let barItem = UIBarButtonItem(customView: shareButton)
        barItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        return barItem
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    init(photo: Rover.Photo? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.photo = photo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupNavigationBar()
        setupImage()
        placeLoadingIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.topItem?.title = " "
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
    }
    
    private func setupNavigationBar() {
        guard let photo = photo else { return }
        
        navigationItem.titleView = setTitle(title: "Photo ID",titleColor: .white, subtitle: "\(photo.id)",subtitleColor: .white)
        navigationItem.rightBarButtonItem = rightBarItem
        
        NSLayoutConstraint.activate([
            rightBarItem.customView!.heightAnchor.constraint(equalToConstant: 24),
            rightBarItem.customView!.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    
    private func placeLoadingIndicator() {
        view.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    private func setupImage() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 16),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -16),
        ])
        
        // DOWNLOAD IMAGE
        guard let url = URL(string: photo?.imageURL ?? "") else { return }
        imageView.af.setImage(withURL: url)
    }
    
    @objc
    func shareButtonTapped() {
        guard let image = imageView.image else { return }
        
        loadingIndicator.startAnimating()
        
        DispatchQueue.main.async { [weak self] in
            let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self?.present(activityViewController, animated: true) {
                self?.loadingIndicator.stopAnimating()
            }
        }
    }
}

