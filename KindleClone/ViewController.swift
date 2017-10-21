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
       // setupBooks()
        fetchBooks()
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
        let selectedBook = books?[indexPath.row]
        //present a navigation comtroller with a collectionviewcomtroller inside
        let layout = UICollectionViewFlowLayout()
        let pageViewController = PagerViewController(collectionViewLayout: layout)
        pageViewController.book = selectedBook
        let navigationController = UINavigationController(rootViewController: pageViewController)
        present(navigationController, animated: false, completion: nil)
        
    }
        
    func fetchBooks(){
        
        if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
            
            URLSession.shared.dataTask(with: url, completionHandler: {
                (data, response, error) in
                
                
                if error == nil, let data = data {
                    
                    do{
                        let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                        let bookDictionaties = json as! [[String:Any]]
                        self.books = []
                        for bookDict in bookDictionaties {
                            let newBook = Book(bookDict)
                            self.books?.append(newBook)
                            //print(newBook.author)
                        }
                        
                        DispatchQueue.main.async {
                            //print(books)
                            self.tableView.reloadData()
                        }
                    }catch let jsonError{
                        print("Failed to parse json properly")
                    }
                    //for book in booksD
                }else{
                    print ("Unable to fetch the data ")
                }
                
            }).resume()
            
            
        }
    }
    
}

