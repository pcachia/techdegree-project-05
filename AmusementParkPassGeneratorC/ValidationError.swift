//
//  ValidationError.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 1/22/20.
//  Copyright © 2020 Phil Cachia. All rights reserved.
//
//  Credit: http://blogs.innovationm.com/validation-handling-in-swift-3-0/
//
// the page contains an inventory of all errors meesages that could occur while passing data from the main view to the second view

struct ValidationError {
    
    var errorCode: Int!
    var errorString: String!
    
    init(code: Int, message: String) {
        
        errorCode = code
        errorString = message
    }
    
    struct ErrorCodes {
        
        static let errorCodeEmptyText = 2001
        
        static let errorCodeInvalidAlphabeticTest = 3001
        static let errorCodeInvalidNumericTest = 3002
        static let errorCodeInvalidAlphaNumericTest = 3003
        
        static let errorCodeInvalidDateOfBirth = 4010
        static let errorCodeInvalidSocialSecurityNumber = 4020
        static let errorCodeInvalidProject = 4030
        static let errorCodeInvalidFirstName = 4040
        static let errorCodeInvalidLastName = 4050
        static let errorCodeInvalidCompany = 4060
        static let errorCodeInvalidStreetAddress = 4110
        static let errorCodeInvalidCity = 4120
        static let errorCodeInvalidState = 4130
        static let errorCodeInvalidZipCode = 4140
    }
    
    struct ErrorMessages {
        
        static let msgEmptyDateOfBirth = "Please enter a date of birth"
        static let msgInvalidDateOfBirth = "Please enter a valid date of birth MM-DD-YYYY"
        static let msgEmptySocialSecurityNumber = "Please enter a social security number"
        static let msgInvalidSocialSecurityNumber = "Please enter a valid social security number"
        static let msgEmptyProject = "Please enter a project"
        static let msgInvalidProject = "Please enter a valid project"
        static let msgEmptyFirstName = "Please enter a first name"
        static let msgInvalidFirstName = "Please enter a valid first name"
        static let msgEmptyLastName = "Please enter a last name"
        static let msgInvalidLastName = "Please enter a valid last name"
        static let msgEmptyCompany = "Please enter a company"
        static let msgInvalidCompany = "Please enter a valid company"
        static let msgEmptyStreetAddress = "Please enter a street address"
        static let msgInvalidStreetAddress = "Please enter a valid street address"
        static let msgEmptyCity = "Please enter a city"
        static let msgInvalidCity = "Please enter a valid city"
        static let msgEmptyState = "Please enter a state"
        static let msgInvalidState = "Please enter a valid state"
        static let msgEmptyZipCode = "Please enter a zip code"
        static let msgInvalidZipCode = "Please enter a valid zip code"

        static let msgInvalidAlphaNumericTest = "Please enter a valid AlphaNumeric Text"
        static let msgInvalidAlphabeticalTest = "Please enter a valid Alphabetical Text"
        static let msgInvalidNumericTest = "Please enter a valid Numeric Text"

    }
}
