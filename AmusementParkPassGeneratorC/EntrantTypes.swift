//
//  EntrantTypes.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

//MARK:- ENTRANT TYPES

import Foundation

//MARK:- GUESTS
enum GuestType {
    case classic
    case vip
    case freeChild
    case season
    case senior
}

//MARK:- Employees
enum EmployeeType {
    case foodServices
    case rideServices
    case maintenance
}

//MARK:- MANAGERS
enum ManagerType {
    case seniorManager
    case generalManager
    case shiftManager
}

//MARK:- CONTRACTORS
enum ContractorType {
    case contractEmployee
}

//MARK:- VENDORS
enum VendorType {
    case vendor
}
