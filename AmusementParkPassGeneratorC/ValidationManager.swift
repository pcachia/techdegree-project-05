//
//  ValidationManager.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 1/22/20.
//  Copyright © 2020 Phil Cachia. All rights reserved.
//
//  Credit: http://blogs.innovationm.com/validation-handling-in-swift-3-0/
//
// Page to validate date before it it is moved to the second view controler

import UIKit

//static private let regexEmail = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
//static private let regexMobNo = "^[0-9]{6,15}$"
//static private let regexNameType = "^[a-zA-Z]+$"
private let regexAlphabetType = "^[a-zA-Z]+$"
private let regexNumericalType = "^[0-9]+$"
private let regexAlphanumericalType = "^[a-zA-Z0-9 ]+$"
// YYYY-MM-DD
private let regexDateType = "\\b(0?[1-9]|1[0-2])[-./](3[0-1]|[1-2][0-9]|0?[1-9])[-./](?:20)?(\\d\\d)\\b"

func validateForm(createPassModel: FormValidationModel) -> ValidationError? {
    
    var validationError: ValidationError? = nil

    validationError = validateDateOfBirth(string: createPassModel.dateOfBirth!, enabled: createPassModel.dateOfBirthEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateSocialSecurityNumber(string: createPassModel.socialSecurityNumber!, enabled: createPassModel.socialSecurityNumberEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateProject(string: createPassModel.project!, enabled: createPassModel.projectEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateFirstName(string: createPassModel.firstName!, enabled: createPassModel.firstNameEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateLastName(string: createPassModel.lastName!, enabled: createPassModel.lastNameEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateCompany(string: createPassModel.company!, enabled: createPassModel.companyEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateStreetAddress(string: createPassModel.streetAddress!, enabled: createPassModel.streetAddressEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateCity(string: createPassModel.city!, enabled: createPassModel.cityEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateState(string: createPassModel.state!, enabled: createPassModel.stateEnabled)
    if validationError != nil {
        return validationError
    }

    validationError = validateZipCode(string: createPassModel.zipCode!, enabled: createPassModel.zipCodeEnabled)
    if validationError != nil {
        return validationError
    }

    return validationError
}

//MARK: validate dateOfBirth
func validateDateOfBirth(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyDateOfBirth)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexDateType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidDateOfBirth, message: ValidationError.ErrorMessages.msgInvalidDateOfBirth)
            }
        }
    }
    return validationError
}

//MARK: validate socialSecurityNumber
func validateSocialSecurityNumber(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptySocialSecurityNumber)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexNumericalType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidSocialSecurityNumber, message: ValidationError.ErrorMessages.msgInvalidSocialSecurityNumber)
            }
        }
    }
    return validationError
}

//MARK: validate project
func validateProject(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyProject)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexNumericalType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidProject, message: ValidationError.ErrorMessages.msgInvalidProject)
            }
        }
    }
    return validationError
}

//MARK: validate firstName
func validateFirstName(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyFirstName)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexAlphabetType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidFirstName, message: ValidationError.ErrorMessages.msgInvalidFirstName)
            }
        }
    }
    return validationError
}

//MARK: validate lastName
func validateLastName(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyLastName)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexAlphabetType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidLastName, message: ValidationError.ErrorMessages.msgInvalidLastName)
            }
        }
    }
    return validationError
}

//MARK: validate company
func validateCompany(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyCompany)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexAlphanumericalType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidCompany, message: ValidationError.ErrorMessages.msgInvalidCompany)
            }
        }
    }
    return validationError
}

//MARK: validate streetAddress
func validateStreetAddress(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyStreetAddress)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexAlphanumericalType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidStreetAddress, message: ValidationError.ErrorMessages.msgInvalidStreetAddress)
            }
        }
    }
    return validationError
}

//MARK: validate city
func validateCity(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyCity)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexAlphabetType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidCity, message: ValidationError.ErrorMessages.msgInvalidCity)
            }
        }
    }
    return validationError
}

//MARK: validate state
func validateState(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyState)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexAlphabetType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidState, message: ValidationError.ErrorMessages.msgInvalidState)
            }
        }
    }
    return validationError
}

//MARK: validate zipCode
func validateZipCode(string: String?, enabled: Bool) -> ValidationError? {
    var validationError : ValidationError? = nil
    if enabled == true {
        if string == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyZipCode)
        } else {
            let stringTest = NSPredicate(format: "SELF MATCHES %@", regexAlphanumericalType)
            let matchString = stringTest.evaluate(with: string)
            if(!matchString) {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidZipCode, message: ValidationError.ErrorMessages.msgInvalidZipCode)
            }
        }
    }
    return validationError
}

