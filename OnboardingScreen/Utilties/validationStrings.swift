//
//  validationStrings.swift
//  OnboardingScreen
//
//  Created by Ashutosh Arage on 10/09/20.
//  Copyright © 2020 Ashutosh Arage. All rights reserved.
//

import Foundation
import UIKit
extension String {
   var isValidEmail: Bool {
      let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
      return !testEmail.evaluate(with: self)
   }
   var isValidPhone: Bool {
      let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
      let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
      return testPhone.evaluate(with: self)
   }
    
}

func placeholderError(field: UITextField!,msg:String) {
        field.attributedPlaceholder = NSAttributedString(string: msg,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red.withAlphaComponent(0.5)])
    }

