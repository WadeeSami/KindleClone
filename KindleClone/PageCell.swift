//
//  PageCell.swift
//  KindleClone
//
//  Created by Wadee Sami on 10/20/17.
//  Copyright © 2017 Wadee AbuZant. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error inside coder")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(pageLabel)
        pageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant:10).isActive = true
        pageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant:-10).isActive = true
        pageLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    var pageLabel : UILabel  = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Some Text Some TextSome TextSome TextSome TextSome TextSome TextSome TextSome TextSome TextSome TextSome TextSome TextSome TextSome Text"
        //label.textAlignment = .center
        label.numberOfLines =  0
        return label
    }()
}
