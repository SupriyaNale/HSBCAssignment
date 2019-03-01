//
//  LoginViewController.swift
//  HSBCOnlineTest
//
//  Created by Admin on 2/26/19.
//  Copyright © 2019 CG. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    var presentor:ViewToPresenterLoginProtocol?
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        /* Adding padding to text fields */
        self.userNameTextField.setLeftPaddingPoints(10)
        self.userNameTextField.setRightPaddingPoints(10)

        self.passwordTextField.setLeftPaddingPoints(10)
        self.passwordTextField.setRightPaddingPoints(10)
        
        /* Keyboard handling */
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /* Login button action*/
    @IBAction func onLoginButtonTapped(_ sender: Any) {
        self.view.endEditing(true)
        presentor?.notifyLoginButtonTapped()
        showProgressIndicator(view: self.view)
    }
    
    func navigateToBookList(alert: UIAlertAction!)  {
        presentor?.notifyNavigateToBookList(navigationController : navigationController!)
    }
}

extension LoginViewController : PresenterToViewLoginProtocol {
    
    func getLoginModel() -> LoginModel {
        return LoginModel.init(username: userNameTextField.text ?? "hsbc", password: passwordTextField.text ?? "123456")
    }
    
    func showNotice() {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Success", message: "Login Successfull.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler:navigateToBookList))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError() {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Login Failed. Please try again.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


extension LoginViewController : UITextFieldDelegate {
    /* UIKeyboard show/hide notification */
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
     /* Keyboard return button Handling */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            self.passwordTextField.resignFirstResponder()
            presentor?.notifyLoginButtonTapped()
            showProgressIndicator(view: self.view)
        }
        return true
    }
}
 
extension UITextField {
    /* Added TextField Padding */
    func setLeftPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
