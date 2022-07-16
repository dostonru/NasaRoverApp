//
//  PhotosViewController.swift
//  NasaApp
//
//  Created by Doston Rustamov on 15/07/22.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var photos = [Rover.Photo]()
    private var cameraName: String!
    private var subtitle: String!
    
    weak var coordinator: PhotosCoordinator?
    
    lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Empty"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.frame = view.bounds
        return label
    }()
    
    private lazy var photoCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: view.frame.width/3-24, height: view.frame.width/3-24)
        return layout
    }()
    
    private lazy var photoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: photoCollectionViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    init(photos: [Rover.Photo], title: String, subtitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.photos = photos
        self.cameraName = title
        self.subtitle = subtitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 220/255, green: 206/255, blue: 190/255, alpha: 1)
        view.addSubview(emptyLabel)
        view.addSubview(photoCollectionView)
        setTitle(title: cameraName, subtitle: subtitle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.topItem?.title = " "
    }
    
    func setTitle(title: String, subtitle: String) {
        navigationItem.titleView = self.setTitle(title: title,titleColor: .black, subtitle: subtitle,subtitleColor: .gray)
    }
}


