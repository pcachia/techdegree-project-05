//
//  Objects.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 12/26/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//
// objects for viewcontroller and second view

import UIKit

// MARK: - Main Menu Buttons
var guestMainView: UIButton = {
    let button = UIButton()
    button.customMainMenuUIButtonProperties()
    button.setTitle("Guest", for: .normal)
    return button
}()
var employeeMainView: UIButton = {
    let button = UIButton()
    button.customMainMenuUIButtonProperties()
    button.setTitle("Employee", for: .normal)
    return button
}()
var managerMainView: UIButton = {
    let button = UIButton()
    button.customMainMenuUIButtonProperties()
    button.setTitle("Manager", for: .normal)
    return button
}()
var contractorMainView: UIButton = {
    let button = UIButton()
    button.customMainMenuUIButtonProperties()
    button.setTitle("Contractor", for: .normal)
    return button
}()
var vendorMainView: UIButton = {
    let button = UIButton()
    button.customMainMenuUIButtonProperties()
    button.setTitle("Vendor", for: .normal)
    return button
}()

// MARK: - Sub Menu Buttons
// guest buttons
var guestClassicSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Classic", for: .normal)
    return button
}()
var guestVipSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("VIP", for: .normal)
    return button
}()
var guestChildSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Free Child", for: .normal)
    return button
}()
var guestSeasonSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Season Pass", for: .normal)
    return button
}()
var guestSeniorSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Senior", for: .normal)
    return button
}()
// employee buttons
var employeeFoodServicesSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Food Services", for: .normal)
    return button
}()
var employeeRideServicesSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Ride Services", for: .normal)
    return button
}()
var employeeMaintenanceSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Maintenance", for: .normal)
    return button
}()
// manager bubttons
var managerSeniorSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Senior", for: .normal)
    return button
}()
var managerGeneralSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("General", for: .normal)
    return button
}()
var managerShiftSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Shift", for: .normal)
    return button
}()
// contract employee buttons
var contractorSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Contract Employee", for: .normal)
    return button
}()
// vendor buttons
var vendorSubView: UIButton = {
    let button = UIButton()
    button.customSubMenuUIButtonProperties()
    button.setTitle("Vendor", for: .normal)
    return button
}()

// MARK: - Date of Birth
var dateOfBirthLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Date of Birth"
    return label
}()
var dateOfBirthTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - Social Security Number
var socialSecurityNumerLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "SSN"
    return label
}()
var socialSecurityNumberTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - Project
var projectLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Project"
    return label
}()
var projectTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - First Name
var firstNameLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "First Name"
    return label
}()
var firstNameTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - Last Name
var lastNameLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Last Name"
    return label
}()
var lastNameTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - Company
var companyLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Company"
    return label
}()
var companyTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - Street Address
var streetAddressLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Street Address"
    return label
}()
var streetAddressTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - City
var cityLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "City"
    return label
}()
var cityTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - State
var stateLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "State"
    return label
}()
var stateTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
// MARK: - Zip
var zipCodeLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "ZIP"
    return label
}()
var zipCodeTextField: UITextField = {
    let textField = UITextField()
    textField.customUITextFieldProperties()
    return textField
}()
var generatePassButton: UIButton = {
    let button = UIButton()
    button.customSubmitUIButtonProperties()
    button.backgroundColor = .green
    button.setTitle("Generate Pass",for: .normal)
    return button
}()
var populateDataButton: UIButton = {
    let button = UIButton()
    button.customSubmitUIButtonProperties()
    button.backgroundColor = .blue
    button.setTitle("Populate Data",for: .normal)
    return button
}()

// MARK: - Protocol to activate fields
protocol ActiveTextFields {
    var enableNameableTextFields: Bool { get }
    var enableAddressTextFields: Bool { get }
    var enableSocialSecurityNumberTextField: Bool { get }
    var enableDateOfBirthTextField: Bool { get }
    var enableProjectNameTextField: Bool { get }
    var enableVendorNameTextField: Bool { get }
}
// MARK: - Struct to activate fields
struct UsableTextFields: ActiveTextFields {
    var enableNameableTextFields: Bool
    var enableAddressTextFields: Bool
    var enableSocialSecurityNumberTextField: Bool
    var enableDateOfBirthTextField: Bool
    var enableProjectNameTextField: Bool
    var enableVendorNameTextField: Bool
}

// MARK: - Create New Pass
var createNewPass: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Create New Pass"
    // custom label properties
    label.textAlignment = .center
    label.font =  UIFont(name: "Arial", size: 22.0)
    label.backgroundColor = .systemIndigo
    label.textColor = .white
    return label
}()

// MARK: - Entrant Picture
let imageName = "FaceImageAsset.png"
let image = UIImage(named: imageName)
let entrantImage = UIImageView(image: image!)

// MARK: - Access Testing
var accessTesting: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Access Testing"
    // custom label properties
    label.textAlignment = .center
    label.font =  UIFont(name: "Arial", size: 22.0)
    return label
}()
// MARK: - Access Testing
var accessTestingInfo: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Confirm the pass has the expected level of access when swaped at the kiosk"
    // custom label properties
    label.textAlignment = .center
    label.font =  UIFont(name: "Arial", size: 12.0)
    label.textColor = .darkGray
    return label
}()

// MARK: - Access Test Buttons
// Office
var officeTestButton: UIButton = {
     let button = UIButton()
     button.customTestUIButtonProperties()
     button.setTitle("Office",for: .normal)
     return button
 }()
// Kitchen
var kitchenTestButton: UIButton = {
    let button = UIButton()
    button.customTestUIButtonProperties()
    button.setTitle("Kitchen",for: .normal)
    return button
}()
// Rides Control
var ridesControlTestButton: UIButton = {
    let button = UIButton()
    button.customTestUIButtonProperties()
    button.setTitle("Rides Control",for: .normal)
    return button
}()
// Amusement
var amusementTestButton: UIButton = {
    let button = UIButton()
    button.customTestUIButtonProperties()
    button.setTitle("Amusement",for: .normal)
    return button
}()
// Rides
var ridesTestButton: UIButton = {
    let button = UIButton()
    button.customTestUIButtonProperties()
    button.setTitle("Rides",for: .normal)
    return button
}()
// Food Discount
var foodDiscountTestButton: UIButton = {
    let button = UIButton()
    button.customTestUIButtonProperties()
    button.setTitle("Food Discount",for: .normal)
    return button
}()
// Merc Discount
var mercDiscountTestButton: UIButton = {
    let button = UIButton()
    button.customTestUIButtonProperties()
    button.setTitle("Merc Discount",for: .normal)
    return button
}()
// Maintenance
var maintenanceTestButton: UIButton = {
    let button = UIButton()
    button.customTestUIButtonProperties()
    button.setTitle("Maintenance",for: .normal)
    return button
}()

let entrantInfoLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.font = UIFont(name:"Arial", size: 14.0)
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.numberOfLines = 0
    return label
}()
let emptyLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.font = UIFont(name:"Arial", size: 14.0)
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.numberOfLines = 0
    return label
}()
// Label for Access test result
var testAccessLabel: UILabel = {
    let label = UILabel()
    label.customUILabelProperties()
    label.text = "Click any access button to test if entrant has access."
    label.font = UIFont(name:"Arial", size: 18.0)
    label.textAlignment = .center
    label.backgroundColor = .darkGray
    label.textColor = .white
    return label
}()
// MARK: - Create Pass Button
var createPassButton: UIButton = {
    let button = UIButton()
    button.customSubmitUIButtonProperties()
    button.backgroundColor = .green
    button.setTitle("Create Pass",for: .normal)
    return button
}()
