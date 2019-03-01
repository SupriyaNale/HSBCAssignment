//
//  BookRouter.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation
import UIKit

class BookRouter:PresenterToRouterBookProtocol {
    
    static func createModule() -> BookListViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "BookListViewController") as! BookListViewController
        
        let presenter: ViewToPresenterBookProtocol & InteractorToPresenterBookProtocol = BookPresenter()
        let interactor: PresenterToInteractorBookProtocol = BookInteractor()
        let router:PresenterToRouterBookProtocol = BookRouter()
        
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
}
