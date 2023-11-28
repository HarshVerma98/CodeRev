//
//  ImagesViewController.swift
//  Example
//
//  Created by Harsh Verma on 11/11/23.

import UIKit
import SDWebImage

class ImagesViewController: UIViewController {

    // MARK: - Properties
    var topic: ImageDataModel?
    var photos: [ImageDataModel] = []
    let imagesPerPage = 30
    var currentPage = 1
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .white
        return collection
    }()
    
    // MARK: - VC Method
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(collectionView)
        navigationItem.title = topic?.title ?? ""
        let backButton = UIBarButtonItem()
        backButton.title = topic?.title ?? ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        NetworkManager.shared.fetchPhotosForTopic(topic: topic?.slug ?? "", page: currentPage, completion: { imageData, error in
            if let error = error {
                print("Something went wrong")
            }else {
                DispatchQueue.main.async {
                    self.photos = imageData ?? []
                    self.collectionView.reloadData()
                }
            }
           
        })
    }
}

// MARK: - UICollectionView Extension
extension ImagesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellWidth = (collectionViewWidth - 16)
        return CGSize(width: cellWidth, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Unable to dequeue CustomCollectionViewCell")
        }
        
        // Configure the cell with data (replace with your data source)
        if let photoURL = URL(string: photos[indexPath.item].urls?.regular ?? ""), let description = photos[indexPath.item].description {
            cell.configure(with: photoURL, description: description)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == photos.count - 1 {
            currentPage += 1
            NetworkManager.shared.fetchPhotosForTopic(topic: topic?.slug ?? "", page: currentPage, completion: { imageData, error in
                if let error = error {
                    print("Something went wrong \(error.localizedDescription)")
                }else {
                    DispatchQueue.main.async {
                        self.photos = imageData ?? []
                        self.collectionView.reloadData()
                    }
                }
               
            })
        }
    }
}
