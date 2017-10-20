//
//  Models.swift
//  KindleClone
//
//  Created by Wadee Sami on 10/6/17.
//  Copyright © 2017 Wadee AbuZant. All rights reserved.
//

import Foundation

//
//  Models.swift
//  KindleLBTA
//
//  Created by Brian Voong on 12/21/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import Foundation
import UIKit

class Book {
    let title: String
    let author: String
    let pages: [Page]
    let image: UIImage
    init(title: String, author: String,image: UIImage ,pages: [Page]) {
        self.title = title
        self.author = author
        self.image = image
        self.pages = pages
    }
}

class Page {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}
