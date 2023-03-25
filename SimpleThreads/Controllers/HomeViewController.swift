//  ViewController.swift
//  SimpleThreads
//  Created by Andrea Jimenez on 9/28/22

import UIKit
import FirebaseFirestore
import FirebaseStorage

class HomeViewController: UIViewController {
    
    var retrievedImages = [UIImage]()
    
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredCollectionView.dataSource = self
        navigationItem.searchController = searchController
        searchController.searchBar.isHidden = true
        retrievePhotos()
    }
    
    @IBAction func onTap(_ sender: Any) {
        searchController.isActive = true
        searchController.searchBar.isHidden = false
    }
    
    // Retrieve images from DB
    func retrievePhotos() {
        // Get data from database
        let db = Firestore.firestore()
        db.collection("products").getDocuments { snapshot, error in
            guard let docSnapshot = snapshot, error == nil else { return }
            var images = [String]()
            // we want to go into each document and in each document get the url of the image
            for doc in docSnapshot.documents {
                // extract file image path
                let imageName = doc["imageName"]
                images.append(imageName as! String)
            }
            // get reference to storage
            let storageRef = Storage.storage().reference()
            // Loop thorugh each file path and fetch the data from storage
            for imageName in images {
                
                // specify the path
                let imageRef = storageRef.child(imageName)
                imageRef.getData(maxSize: 5 * 1024 * 1024) { imageData, error in
                    // Check for possible errors
                    guard let imageData = imageData, error == nil else {
                        print("Error get image data: \(error)")
                        return
                    }
                    
                    // If we are able to create an image from the image data, jump back to the main thread and append the
                    // new image to the retrievedImages array.
                    if let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.retrievedImages.append(image)
                        }
                        
                    } else {
                        print("Error creating image from data")
                    }
                }
            }
            // reload collection to show updates when retrievedImages is populated with images
            self.featuredCollectionView.reloadData()
        }
    }
}

// Collection View Datasource Methods
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(retrievedImages.count)
        return retrievedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        // cell.layer.cornerRadius = 25
        return cell
    }
    
    // Setup header for collection view
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let featuredHeaderview = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "featuredHeader", for: indexPath)
            return featuredHeaderview
        } else {
            return UICollectionReusableView()
        }
    }
}

