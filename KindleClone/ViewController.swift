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
        
        setUpBarStyles()
        setUpBarButtons()
        navigationItem.title = "Kindle"
        // remove additional cells from table
        tableView.tableFooterView = UIView()
        
        // register cell
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellid")
        fetchBooks()
        
        //
        tableView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        tableView.separatorColor = UIColor(white: 1, alpha: 0.2)
    }
    
    func setUpBarStyles(){
        print("wadee")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 44/255, green: 40/255, blue: 40/255, alpha: 1)
        
        //set the title color
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    func setUpBarButtons(){
        let leftBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftBtn
        
        let rightBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)

        navigationItem.rightBarButtonItem = rightBtn
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
                    }catch _{
                        print("Failed to parse json properly")
                    }
                    //for book in booksD
                }else{
                    print ("Unable to fetch the data ")
                }
                
            }).resume()
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
        let segmentedControl = UISegmentedControl(items: ["Cloud", "Device"])
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        //segmentedControl.tintColor = .white
        footerView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        let gridBtn = UIButton(type: .system)
        gridBtn.setImage(#imageLiteral(resourceName: "grid").withRenderingMode(.alwaysOriginal), for: .normal)
        gridBtn.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(gridBtn)
        gridBtn.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 8).isActive = true
        gridBtn.widthAnchor.constraint(equalToConstant:40).isActive = true
        gridBtn.heightAnchor.constraint(equalToConstant:40).isActive = true
        gridBtn.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        /// handle the sort btn
        let sortBtn = UIButton(type: .system)
        sortBtn.setImage(#imageLiteral(resourceName: "sort").withRenderingMode(.alwaysOriginal), for: .normal)
        sortBtn.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(sortBtn)
        sortBtn.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: -8).isActive = true
        sortBtn.widthAnchor.constraint(equalToConstant:40).isActive = true
        sortBtn.heightAnchor.constraint(equalToConstant:40).isActive = true
        sortBtn.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true

        return footerView
    }
}

