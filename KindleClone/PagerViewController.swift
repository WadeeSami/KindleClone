//
//  PagerViewController.swift
//  KindleClone
//
//  Created by Wadee Sami on 10/20/17.
//  Copyright © 2017 Wadee AbuZant. All rights reserved.
//

import UIKit

class PagerViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView?.backgroundColor = UIColor.white
        navigationItem.title = "Pages"
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        collectionView?.isPagingEnabled = true
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.minimumLineSpacing = 0
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        
        
        if indexPath.row %  2 == 0 {
            cell.backgroundColor = .red
        }else{
            cell.backgroundColor = .blue
        }
        print("here is a cell")
        return cell
    }
    
    
    
}
