//
//  BrowseMatchesDataSource.swift
//  OKC
//
//  Created by Laticia Chance on 3/6/18.
//  Copyright © 2018 Laticia Chance. All rights reserved.
//

import UIKit

final class BrowseMatchesDataSource: NSObject {
    var userDetails = [UserDetails]()
    var viewModels = [CollectionViewCellViewModel]()
    
    func register(collectionView: UICollectionView) {
//        collectionView.register(BrowseMatchUserCell.self, forCellWithReuseIdentifier:String(describing: BrowseMatchUserCell.self))

    }
}

extension BrowseMatchesDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let viewModel = viewModels[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: viewModel.cellType), for: indexPath) as UICollectionViewCell
        viewModel.commands[.configure]?.perform(arguments: [.cell: cell])
        
        return cell
    }
}


extension BrowseMatchesDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.4) {
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.viewWithTag(2)?.transform = .init(scaleX: 0.55, y: 0.55)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.4) {
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.viewWithTag(2)?.transform = .identity
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        cell.alpha = 0
        UIView.animate(withDuration: 0.8) {
            cell.alpha = 1
        }
    }
    
}
