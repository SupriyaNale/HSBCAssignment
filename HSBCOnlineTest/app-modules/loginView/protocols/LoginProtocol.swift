//
//  LoginProtocol.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//


import Foundation
import UIKit

protocol ViewToPresenterLoginProtocol:class {
    var view: PresenterToViewLoginProtocol? {get set}
    var interactor: PresenterToInteractorLoginProtocol? {get set}
    var router: PresenterToRouterLoginProtocol? {get set}
    
    func notifyLoginButtonTapped()
    func notifyNavigateToBookList(navigationController: UINavigationController)
}

protocol PresenterToViewLoginProtocol:class {    
    func getLoginModel() -> LoginModel
    func showNotice()
    func showError()
}

protocol PresenterToRouterLoginProtocol:class {
    static func createModule()-> LoginViewController
    func pushToBookListScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorLoginProtocol:class {
    var presenter:InteractorToPresenterLoginProtocol? {get set}
    func authenticateUser(model:LoginModel)
}

protocol InteractorToPresenterLoginProtocol:class {
    
    func loginFetchedSuccess()
    func loginFetchFailed()
}
