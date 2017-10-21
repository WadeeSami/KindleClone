//
//  PagerViewController.swift
//  KindleClone
//
//  Created by Wadee Sami on 10/20/17.
//  Copyright © 2017 Wadee AbuZant. All rights reserved.
//

import UIKit

class PagerViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    var  book : Book?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView?.backgroundColor = UIColor.white
        navigationItem.title = book!.title
        let layout = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        
        collectionView?.isPagingEnabled = true
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height - CGFloat(66))
        layout.minimumLineSpacing = 0
        
        // set the close button
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleCloseBook))
    }
    
    
    
    
    func handleCloseBook(){
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return book?.pages.count ?? 0
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as? PageCell
        
        
        cell?.pageLabel.text = book?.pages[indexPath.row].text ?? "SOme text"
        return cell!
    }
    
    
    
}
