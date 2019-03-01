//
//  BookProtocol.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation

protocol ViewToPresenterBookProtocol:class {
    
    var view: PresenterToViewBookProtocol? {get set}
    var interactor: PresenterToInteractorBookProtocol? {get set}
    var router: PresenterToRouterBookProtocol? {get set}
    func startFetchingBookList()
}

protocol PresenterToViewBookProtocol:class {
    
    func showBookList(array: Array<BookModel>)
    func showError()
}

protocol PresenterToRouterBookProtocol:class {
    
}

protocol PresenterToInteractorBookProtocol:class {
    
    var presenter:InteractorToPresenterBookProtocol? {get set}
    func getBookList()
}

protocol InteractorToPresenterBookProtocol:class {
    func bookFetchedSuccess(bookModelArray: Array<BookModel>)
    func bookFetchFailed()
}
