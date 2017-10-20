//
//  ViewController.swift
//  KindleClone
//
//  Created by Wadee Sami on 10/6/17.
//  Copyright © 2017 Wadee AbuZant. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var books : [Book]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //view.backgroundColor = UIColor.red
        setupBooks()
        navigationItem.title = "Kindle"
        // remove additional cells from table
        tableView.tableFooterView = UIView()
        
        // register cell
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellid")
    }
    
    // MARK : the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.books?.count{
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! BookCell
        
        cell.book = books?[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //present a navigation comtroller with a collectionviewcomtroller inside
        let layout = UICollectionViewFlowLayout()
        let pageViewController = PagerViewController(collectionViewLayout: layout)
        let navigationController = UINavigationController(rootViewController: pageViewController)
        present(navigationController, animated: false, completion: nil)
        
    }
    func setupBooks() {
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This is text for second page")
        
        let pages = [page1, page2]
        let image1 : UIImage = #imageLiteral(resourceName: "steve_jobs")
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson",image:image1 ,pages: pages)
        
        let image2 : UIImage = #imageLiteral(resourceName: "bill_gates")
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", image: image2, pages: [
            Page(number: 1, text: "Text for page 1"),
            Page(number: 2, text: "Text for page 2"),
            Page(number: 3, text: "Text for page 3"),
            Page(number: 4, text: "Text for page 4")
            ])
        
        self.books = [book, book2]
    }


}

