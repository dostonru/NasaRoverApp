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
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        setupNavigationBar()
        setupImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func setupNavigationBar() {
        guard let photo = photo else { return }
        navigationItem.titleView = setTitle(title: "Photo ID",titleColor: .white, subtitle: "\(photo.id)",subtitleColor: .white)
        
        let menuBtn = UIButton(type: .system)
        menuBtn.contentMode = .scaleAspectFit
        menuBtn.setImage(UIImage(named: "share"), for: .normal)
        menuBtn.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: menuBtn)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuBarItem.customView!.heightAnchor.constraint(equalToConstant: 24),
            menuBarItem.customView!.widthAnchor.constraint(equalToConstant: 24)
        ])

        navigationItem.rightBarButtonItem = menuBarItem
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
    
    @objc private func shareButtonTapped() {
        guard let image = imageView.image else { return }
        
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        present(activityViewController, animated: true, completion: nil)
    }

}

