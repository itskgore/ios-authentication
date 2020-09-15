//
//  LoginViewController.swift
//  OnboardingScreen
//
//  Created by Ashutosh Arage on 10/09/20.
//  Copyright © 2020 Ashutosh Arage. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class LoginViewController : UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fieldsViewData: UIView!
    
    override func viewDidLoad() {
        
        initialize()
    }
    
    func initialize() {

//        self.fieldsViewData.cornerRadius(usingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 30, height: 30))
     underLineTextField(myTextFeild: email)
           underLineTextField(myTextFeild: password)
           buttonShadow(btnHi: loginButton)
       }
       

    @IBAction func LoginButtonTap(_ sender: Any) {
         let loader = Loader()
        if(validation()) {
//            print(password.text!)
            loader.startFunction(view: self.view)
            let parameters: [String:Any] = [
                "login":email.text!,
                "password":password.text!,
                             ]
            let headers = HTTPHeader(name: "contentType", value: "application/json")
            let url = Constansts.userLogin
            APIManager.shared.hitAPI(httpMethod: HTTPMethod.post, parameters: parameters, url: url, header: headers) { (reponse) in
                loader.removeSpinner(view: self.view)
                print("---------------------------")
                if let code = reponse["code"] {
                    if(code as! Int == 3003 || code as! Int ==  3040) {
                                       AlertBox.showAlert(title: "INVALID", message: "\(reponse["message"]!)", firstButton: "Okay", view: self)

                                       return
                                   }
                }
               
                do{
                     let jsonData = try JSONSerialization.data(withJSONObject: reponse, options: .prettyPrinted)
                     let userData = try JSONDecoder().decode(UserData.self, from: jsonData)
                    print(userData.objectId)
                      self.performSegue(withIdentifier: "FromLogin", sender: self)
                }catch {
                    print(error)
                }
                
                print("---------------------------")

            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.isNavigationBarHidden = true
       }
    
    func validation()->Bool {
        if(email.text?.isEmpty ?? true || email.text?.isValidEmail ?? true) {
            if(email.text?.isEmpty ?? true) {
                placeholderError(field: email, msg: "Please enter valid email-id")
            }else {
                AlertBox.showAlert(title: "ALERT", message: "Please provide a valid email-id", firstButton: "Okay", view: self)
            }
            
            return false
        }
        if(password.text?.isEmpty ?? true) {
             placeholderError(field: password, msg: "Please your password")
            return false
        }
        return true
    }
    
   
}

extension UIView{
    func cornerRadiusView(usingCorners corners: UIRectCorner, cornerRadii: CGSize) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}
