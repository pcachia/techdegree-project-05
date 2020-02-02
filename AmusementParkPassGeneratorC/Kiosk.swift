//
//  Kiosk.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import Foundation

struct Kiosk {
    //Use these functions to check if the entrant has access to an area/discount/ride
    func checkAreaAccess(for pass: Swipeable, and area: AreaAccess) -> Bool {
        if pass.areaAccess.contains(area) {
            return true
        }
        
        return false
    }

    func checkDiscountAccess(for pass: Swipeable, and discount: DiscountAccess) -> Bool {
        if pass.discountAccess.contains(discount) {
            return true
        }
        
        return false
    }
    
    func checkRideAccess(for pass: Swipeable, and ride: RideAccess) -> Bool {
        if pass.rideAccess.contains(ride) {
            return true
        }
        
        return false
    }

}
