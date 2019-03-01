//
//  LoginInteractor.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation
import Alamofire


class LoginInteractor : PresenterToInteractorLoginProtocol {
    weak var presenter: InteractorToPresenterLoginProtocol?
    
    func authenticateUser(model:LoginModel)  {
        let parameters = ["username": model.username, "password": model.password] as [String : Any]
        
        Alamofire.request(API_LOGIN, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                guard let value = response.result.value as? [String: Any],
                    let token = value["token"] as? String else {
                        print("Malformed data received from fetchAllRooms service")
                        self.presenter?.loginFetchFailed()
                        return
                }
                print(token)
                /* Store Authorization Token to defauls */
                UserDefaults.standard.set(token, forKey: "Authorization_Token")
                UserDefaults.standard.synchronize()
                
                self.presenter?.loginFetchedSuccess()
                break
            case .failure(let error):
                print(error)
                self.presenter?.loginFetchFailed()
            }
        }
    }
}
