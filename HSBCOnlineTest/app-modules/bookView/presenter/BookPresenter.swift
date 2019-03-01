//
//  BookPresenter.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import Foundation

class BookPresenter : ViewToPresenterBookProtocol {

    var view: PresenterToViewBookProtocol?
    
    var interactor: PresenterToInteractorBookProtocol?
    
    var router: PresenterToRouterBookProtocol?
    
    init() {}
    
    func startFetchingBookList() {
        interactor?.getBookList()
    }
}

extension BookPresenter : InteractorToPresenterBookProtocol {
    func bookFetchedSuccess(bookModelArray: Array<BookModel>) {
        view?.showBookList(array: bookModelArray)
    }
    
    func bookFetchFailed() {
        view?.showError()
    }
}
