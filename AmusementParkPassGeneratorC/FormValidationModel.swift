//
//  FormValidationModel.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 1/22/20.
//  Copyright © 2020 Phil Cachia. All rights reserved.
//
//  Credit: http://blogs.innovationm.com/validation-handling-in-swift-3-0/
//
//  this file contains a struct which is used to collect data from the main view and have it check if all the data passed is correct

struct FormValidationModel {
 
    // MARK:- VARIABLES
    var dateOfBirth: String?
    var dateOfBirthEnabled: Bool
    var socialSecurityNumber: String?
    var socialSecurityNumberEnabled: Bool
    var project: String?
    var projectEnabled: Bool
    var firstName: String?
    var firstNameEnabled: Bool
    var lastName: String?
    var lastNameEnabled: Bool
    var company: String?
    var companyEnabled: Bool
    var streetAddress: String?
    var streetAddressEnabled: Bool
    var city: String?
    var cityEnabled: Bool
    var state: String?
    var stateEnabled: Bool
    var zipCode: String?
    var zipCodeEnabled: Bool

    //MARK:- CONSTRUCTORS
    
    init(
        formDateOfBirth: String?,
        formDateOfBirthEnabled: Bool,
        formSocialSecurityNumber: String?,
        formSocialSecurityNumberEnabled: Bool,
        formProject: String?,
        formProjectEnabled: Bool,
        formFirstName: String?,
        formFirstNameEnabled: Bool,
        formLastName: String?,
        formLastNameEnabled: Bool,
        formCompany: String?,
        formCompanyEnabled: Bool,
        formStreetAddress: String?,
        formStreetAddressEnabled: Bool,
        formCity: String?,
        formCityEnabled: Bool,
        formState: String?,
        formStateEnabled: Bool,
        formZipCode: String?,
        formZipCodeEnabled: Bool
    ) {
        dateOfBirth = formDateOfBirth
        dateOfBirthEnabled = formDateOfBirthEnabled
        socialSecurityNumber = formSocialSecurityNumber
        socialSecurityNumberEnabled = formSocialSecurityNumberEnabled
        project = formProject
        projectEnabled = formProjectEnabled
        firstName = formFirstName
        firstNameEnabled = formFirstNameEnabled
        lastName = formLastName
        lastNameEnabled = formLastNameEnabled
        company = formCompany
        companyEnabled = formCompanyEnabled
        streetAddress = formStreetAddress
        streetAddressEnabled = formStreetAddressEnabled
        city = formCity
        cityEnabled = formCityEnabled
        state = formState
        stateEnabled = formStateEnabled
        zipCode = formZipCode
        zipCodeEnabled = formZipCodeEnabled
    }
}
