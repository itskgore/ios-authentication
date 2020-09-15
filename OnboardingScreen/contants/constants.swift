//
//  constants.swift
//  OnboardingScreen
//
//  Created by Ashutosh Arage on 09/09/20.
//  Copyright © 2020 Ashutosh Arage. All rights reserved.
//

import Foundation
class Constansts {
    static let applicationId = "1482DFE0-9354-155C-FFF2-7586A7CDD400"
    static let restAPIKey = "CDEEA679-161A-42AB-BDA6-1D10DF6AD823"
    static let baseURL = "https://api.backendless.com/\(applicationId)/\(restAPIKey)/users/"
    static let registerURL = "\(baseURL)register"
    static let userLogin = "\(baseURL)login"
}
