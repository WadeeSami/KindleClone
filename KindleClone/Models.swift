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
    var pages: [Page]
    //let image: UIImage
    var coverImageUrl : String
    
    
    
    init(_ dict:[String:Any]) {
        let title = dict["title"] as? String ?? ""
        let author = dict["author"] as? String ?? ""
        print(dict)
        self.title = title
        self.author = author
        self.coverImageUrl  = dict["coverImageUrl"] as? String ?? ""
        //self.image = #imageLiteral(resourceName: "bill_gates")
        self.pages = []
        var pagesCollection = [Page]()
        if let pageDictionaries = dict["pages"] as? [[String:Any]] {
            for pageDict in pageDictionaries{
                
                if let text = pageDict["text"] as? String {
                    let page = Page(number: 0, text: text)
                    
                    pagesCollection.append(page)
                }
            }
            
            self.pages = pagesCollection
        }
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

