//
//  BrowseMatchesViewController.swift
//  OKC
//
//  Created by Laticia Chance on 2/14/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import UIKit

final class BrowseMatchesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let dataSource = BrowseMatchesDataSource()
    private let networkCall = OKCNetworkingAPI()
    private let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataSource()
        setupView()
        addActivityIndicator()
        fetchData()
    }
    
    // MARK: - Setup
    
    private func setupDataSource() {
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        dataSource.register(collectionView: collectionView)
    }
    
    private func setupView() {
        title = "Browse"
        navigationController?.navigationBar.barTintColor = UIColor(red: 72/255, green: 140/255, blue: 1, alpha: 1.0)
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        if let layout = collectionView?.collectionViewLayout as? CellLayout {
            layout.delegate = self
        }
    }
    
    private func addActivityIndicator() {
        myActivityIndicator.center = view.center
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
    }
    
    private func fetchData() {
        networkCall.getUserData { (response) in
            switch response {
            case .success(let responseData):
                let data = responseData.data

                for x in 0..<data.count {
                    let photoSize = data[x].photo.fullPaths
                    let userLocation = data[x].location
                    let age = data[x].age
                    let match = data[x].match
                    let username = data[x].username

                    let details = UserDetails(age: age,
                                              match: match,
                                              username: username,
                                              location: userLocation,
                                              photo: photoSize)

                    self.dataSource.userDetails.append(details)

                }
                
                let viewModels: [CollectionViewCellViewModel] = self.dataSource.userDetails.map(BrowseMatchUserViewModel.init)
                self.dataSource.viewModels = viewModels
                self.collectionView.reloadData()
                self.myActivityIndicator.stopAnimating()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}

// MARK: - Cell Layout

extension BrowseMatchesViewController: CellLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        var userImage = UIImage()
        
        if let imageData = try? Data(contentsOf: self.dataSource.userDetails[indexPath.item].photo.small),
            let image = UIImage(data: imageData)
        {
            userImage = image
        }
        userImage = userImage.resize(newHeight: 325)
        
        return userImage.size.height
    }
    
}
