//
//  ViewController.swift
//  OKC
//
//  Created by Laticia Chance on 2/14/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let networkCall = OKCNetworkingAPI()
    private let photoParser = UserPhotoParser()
    private let locationParser = UserLocationParser()
    private var userDetails = [UserDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        fetchData()
    }
    
    func viewSetup() {
        self.title = "Browse"
        navigationController?.navigationBar.barTintColor = UIColor(red: 102/255, green: 136/255, blue: 1, alpha: 1.0)
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        collectionView.backgroundColor = .lightGray
        
        if let layout = collectionView?.collectionViewLayout as? CellLayout {
            layout.delegate = self
        }
    }
    
    func fetchData() {
        networkCall.getUserData { (response) in
            switch response {
            case .success(let responseData):
                let data = responseData.result.data
                
                for x in 0..<data.count {
                    guard let photoSize = self.photoParser.parsePhotoSizes(from: data[x].photo.fullPaths),
                        let userLocation = self.locationParser.parseLocationDetails(from: data[x].location)
                        else
                    {
                        return
                    }
                    
                    let age = data[x].age
                    let match = data[x].match
                    let username = data[x].username
                    
                    let details = UserDetails(age: age,
                                              match: match,
                                              username: username,
                                              location: userLocation,
                                              photo: photoSize)
                    
                    self.userDetails.append(details)
                    self.collectionView.reloadData()
                    
                }
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}

// MARK: - Collection View 

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.userDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.masksToBounds = true
        
        let userDetailsIndexPath = userDetails[indexPath.row]
        
        if let usernameLabel = cell.viewWithTag(1) as? UILabel,
            let ageLocationLabel = cell.viewWithTag(3) as? UILabel,
            let matchLabel = cell.viewWithTag(4) as? UILabel,
            let userPhoto = cell.viewWithTag(2) as? UIImageView,
            let imageData = try? Data(contentsOf: userDetailsIndexPath.photo.original)
        {
            let userImage = UIImage(data: imageData)
            userPhoto.image = userImage
            usernameLabel.text = userDetailsIndexPath.username
            matchLabel.text = "\(String(userDetailsIndexPath.match / 100))% Match"
            ageLocationLabel.text = "\(userDetailsIndexPath.age) • \(userDetailsIndexPath.location.cityName), \(userDetailsIndexPath.location.stateCode)"
        }
        return cell
    }
}

// MARK: - Cell Layout

extension ViewController: CellLayoutDelegate {
    func collectionView(_collectionView collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        var userImage = UIImage()
        
        if let imageData = try? Data(contentsOf: self.userDetails[indexPath.item].photo.original),
            let image = UIImage(data: imageData)
        {
            userImage = image
        }
        userImage = resizeImage(image: userImage, newHeight: 325)
        
        return userImage.size.height
    }
    
    func resizeImage(image: UIImage, newHeight: CGFloat) -> UIImage {
        var newImage = UIImage()
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0,width: newWidth, height: newHeight))
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            newImage = image
        }
        UIGraphicsEndImageContext()
    
        return newImage
    }
}
