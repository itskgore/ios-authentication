//
//  alertBox.swift
//  OnboardingScreen
//
//  Created by Ashutosh Arage on 09/09/20.
//  Copyright © 2020 Ashutosh Arage. All rights reserved.
//

import Foundation
import UIKit
extension ViewController {

      func showAlert(title:String,message:String,firstButton:String) {
            let alert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)

                   // add the actions (buttons)
                   alert.addAction(UIAlertAction(title: firstButton, style: UIAlertAction.Style.default, handler: nil))
                   

                   // show the alert
                   self.present(alert, animated: true, completion: nil)
        }
}


class AlertBox {
   static func showAlert(title:String,message:String,firstButton:String,view: Any) {
               let alert = UIAlertController(title: title, message:message, preferredStyle: UIAlertController.Style.alert)

                      // add the actions (buttons)
                      alert.addAction(UIAlertAction(title: firstButton, style: UIAlertAction.Style.default, handler: nil))
                      

                      // show the alert
    (view as AnyObject).present(alert, animated: true, completion: nil)
           }
}
