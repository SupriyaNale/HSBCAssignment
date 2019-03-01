//
//  BookInteractor.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/28/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

class BookInteractor : PresenterToInteractorBookProtocol {
    var presenter: InteractorToPresenterBookProtocol?
    
    func getBookList (){
        let token = UserDefaults.standard.string(forKey: "Authorization_Token") as String? ?? ""
        
        Alamofire.request(API_BOOK_LIST, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": token]).responseJSON { response in
            
            switch response.result {
            case .success:
                guard let json = response.result.value as AnyObject? else {
                    print("Malformed data received from fetchAllRooms service")
                    self.presenter?.bookFetchFailed()
                    return
                }
                print(json)
                let arrayResponse = json as! NSArray
                let arrayObject = Mapper<BookModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                self.presenter?.bookFetchedSuccess(bookModelArray: arrayObject)
                
                break
            case .failure:
                self.presenter?.bookFetchFailed()
            }
        }
    }
}
