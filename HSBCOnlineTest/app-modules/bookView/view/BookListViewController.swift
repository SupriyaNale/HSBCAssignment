//
//  BookListViewController.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class BookListViewController: UIViewController {
    
    var presentor:ViewToPresenterBookProtocol?
    
    @IBOutlet weak var bookListTableView: UITableView!
    
    var booksArray : Array<BookModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Notice-Module"
        presentor?.startFetchingBookList()
        showProgressIndicator(view: self.view)
        
        bookListTableView.dataSource = self
        bookListTableView.delegate = self
    }
}


extension BookListViewController: PresenterToViewBookProtocol {
    func showBookList(array: Array<BookModel>) {
        self.booksArray = array
        hideProgressIndicator(view: self.view)
        bookListTableView.reloadData()
    }
    
    func showError() {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Login Failed. Please try again.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.booksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookmodel = self.booksArray[indexPath.row]
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
            cell.title.text = bookmodel.title
            cell.auther.text = bookmodel.author
            /* Use Alamofire to download the image */
            Alamofire.request(bookmodel.imageUrl).responseData { (response) in
                if response.error == nil {
                    print(response.result)
                    
                    /* Show the downloaded image: */
                    if let data = response.data {
                        cell.bookImage.image = UIImage(data: data)
                    }
                }
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookThumbCell", for: indexPath) as! BookThumbCell
            cell.title.text = bookmodel.title
            cell.auther.text = bookmodel.author
            /* Use Alamofire to download the image */
            Alamofire.request(bookmodel.imageUrl).responseData { (response) in
                if response.error == nil {
                    print(response.result)
                    
                    /* Show the downloaded image: */
                    if let data = response.data {
                        cell.bookImage.image = UIImage(data: data)
                    }
                }
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 287
        } else {
            return 140
        }
    }
}

class BookThumbCell : UITableViewCell {
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var auther : UILabel!
    @IBOutlet weak var bookImage : UIImageView!
}

class BookCell : UITableViewCell {
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var auther : UILabel!
    @IBOutlet weak var bookImage : UIImageView!
}
