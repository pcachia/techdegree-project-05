//
//  ParkAccess.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import Foundation

//Enums for sorting out the different access levels
enum AreaAccess {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum RideAccess {
    case allRides
    case skipLine
}

enum DiscountAccess: Equatable {
    case food(value: Double)
    case merchandise(value: Double)
}
