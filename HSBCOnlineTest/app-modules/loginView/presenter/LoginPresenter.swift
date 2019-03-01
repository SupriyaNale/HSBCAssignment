//
//  LoginPresenter.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter : ViewToPresenterLoginProtocol  {
    
    var view: PresenterToViewLoginProtocol?
    var interactor: PresenterToInteractorLoginProtocol?
    var router: PresenterToRouterLoginProtocol?
    
    init() {}
    
    func notifyLoginButtonTapped()  {
        let loginModel = view?.getLoginModel()
        interactor?.authenticateUser(model: loginModel!)
    }
    
    func notifyNavigateToBookList(navigationController: UINavigationController) {
        router?.pushToBookListScreen(navigationConroller: navigationController)
    }
}

extension LoginPresenter: InteractorToPresenterLoginProtocol {
    
    func loginFetchedSuccess() {
        view?.showNotice()
    }
    
    func loginFetchFailed() {
        view?.showError()
    }
}
