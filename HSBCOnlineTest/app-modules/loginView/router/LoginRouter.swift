//
//  LoginRouter.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter : PresenterToRouterLoginProtocol {
    
    static func createModule() -> LoginViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        let interactor: PresenterToInteractorLoginProtocol = LoginInteractor()
        let router:PresenterToRouterLoginProtocol = LoginRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    /* Navigate to BookList View */
    func pushToBookListScreen(navigationConroller:UINavigationController) {
        let bookView = BookRouter.createModule()
        navigationConroller.pushViewController(bookView,animated: true)
    }
    
}
