//
//  BookCell.swift
//  KindleClone
//
//  Created by Wadee Sami on 10/12/17.
//  Copyright © 2017 Wadee AbuZant. All rights reserved.
//

import Foundation
import UIKit

class BookCell: UITableViewCell {
    var book: Book?{
        didSet{
            self.bookAuthorLabel.text = book?.author
            self.bookTitleLabel.text = book?.title
            self.bookImage.image = book?.image
        }
    }
    private var bookTitleLabel : UILabel = {
        //this is a computed propert
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = .red
        return label
    }()
    
    private var bookAuthorLabel : UILabel  = {
        //this is a computed propert
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = .green
        return label
    }()
    
    private var bookImage : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        //First Call Super
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // fill the cell with the correponding views with thier constraints
        
        addSubview(self.bookImage)
        //add the image
         bookImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8.0).isActive = true
        
        bookImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0).isActive = true
        
        bookImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0).isActive = true
        
        bookImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(self.bookTitleLabel)
        
        bookTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8.0).isActive = true
        
        bookTitleLabel.leftAnchor.constraint(equalTo: bookImage.rightAnchor, constant: 8.0).isActive = true
        
        
        bookTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
        bookTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(self.bookAuthorLabel)
        
        bookAuthorLabel.topAnchor.constraint(equalTo: bookTitleLabel.bottomAnchor, constant: 4).isActive = true
        bookAuthorLabel.leftAnchor.constraint(equalTo: bookImage.rightAnchor, constant: 8).isActive = true
        bookAuthorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        bookAuthorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
}
