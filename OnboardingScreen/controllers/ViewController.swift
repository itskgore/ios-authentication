//
//  ViewController.swift
//  OnboardingScreen
//
//  Created by Ashutosh Arage on 08/09/20.
//  Copyright © 2020 Ashutosh Arage. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var fieldsView: UIView!
    //    @IBOutlet weak var fieldsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialize()
    }
    
    func initialize() {
        self.fieldsView.cornerRadius(usingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 30, height: 30))
        underLineTextField(myTextFeild: firstName)
        underLineTextField(myTextFeild: lastName)
        underLineTextField(myTextFeild: emailField)
        underLineTextField(myTextFeild: passwordField)
        buttonShadow(btnHi: loginButton)
        buttonShadow(btnHi: backButton)
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        let loader = Loader()
      
        let userFirstName = firstName.text ?? ""
        let userLastName = lastName.text ?? "Gore"
        let email = emailField.text ?? "adc@gmail.com"
        let password = passwordField.text ?? "abc123"
//        let register = RegisterModel(email: email, password: password, name: "\(userFirstName) \(userLastName)" )
        
        if(validateFields()) {
              loader.startFunction(view: view)
            let parameters: [String:Any] = [
                      "email":email,
                      "password":password,
                      "name":"\(userFirstName) \(userLastName)"
                  ]
                  let headers = HTTPHeader(name: "contentType", value: "application/json")
                  let url = Constansts.registerURL
                  APIManager.shared.hitAPI(httpMethod: HTTPMethod.post, parameters: parameters, url: url, header: headers) { (reponse) in
                      loader.removeSpinner(view: self.view)
                    print(reponse);
                    if let code = reponse["code"] {
                        if(code as! Int == 3003 || code as! Int ==  3040) {
                                               AlertBox.showAlert(title: "INVALID", message: "\(reponse["message"]!)", firstButton: "Okay", view: self)

                                               return
                                           }
                    }
                   
                      print("---------------------------")
                      do{
                           let jsonData = try JSONSerialization.data(withJSONObject: reponse, options: .prettyPrinted)
                           let userData = try JSONDecoder().decode(UserData.self, from: jsonData)
                        let userDefaults = UserDefaults.standard
                        userDefaults.set(userData.objectId, forKey: "objectID")
                         self.performSegue(withIdentifier: "FromSignup", sender: self)
                      }catch {
                          print(error)
                      }
                      print("---------------------------")

                  }
        }
      
    }
    
    @IBAction func GoBackTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension ViewController {
    func validateFields()->Bool {
        if(firstName.text?.isEmpty ?? true) {
//            firstName.placeholder = "Please enter your first name"
            firstName.attributedPlaceholder = NSAttributedString(string: "Please enter your first name",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.red.withAlphaComponent(0.5)])
            return false
        }
        
        return true
    }
}

extension UIView{
    func cornerRadius(usingCorners corners: UIRectCorner, cornerRadii: CGSize) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: cornerRadii)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}





