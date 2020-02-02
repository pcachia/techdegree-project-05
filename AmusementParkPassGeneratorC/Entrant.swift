//
//  Entrant.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//
// Entrants protocol

import Foundation

//Each entrant has to conform to this protocol
protocol Entrant {
    var pass: Swipeable? { get set }
    
    func swipe(for area: AreaAccess) -> Bool
    func swipe(for discount: DiscountAccess) -> Bool
    func swipe(for ride: RideAccess) -> Bool
}

//Only add this to entrants who need to provide the name
protocol Nameable {
    var firstName: String? { get }
    var lastName: String? { get }
}

//Only add this to entrants who need to provide an address
protocol Address {
    var streetAddress: String? { get }
    var city: String? { get }
    var state: String? { get }
    var zipCode: String? { get }
}

//Only add this to entrants who need to provide a social security number
protocol SocialSecurityNumber {
    var socialSecurityNumer: String? { get }
}

//Only add this to entrants who need to provide a date of birth
protocol DateOfBirth {
    var dateOfBirth: Date? { get }
}

//Only add this to entrants who need to provide vendor information
protocol NameableVendor {
    var vendorName: String? { get }
}

//Only add this to entrants who need to provide a project number
protocol NameableProject {
    var projectName: String? { get }
}

//Only add this to entrants who need to provide a date of visit
protocol DateOfVisit {
    var dateOfVisit: Date? { get }
}
