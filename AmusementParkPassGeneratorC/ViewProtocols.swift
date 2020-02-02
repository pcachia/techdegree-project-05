//
//  ViewProtocols.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 1/20/20.
//  Copyright © 2020 Phil Cachia. All rights reserved.
//

import UIKit

protocol TextField {
    var backgroundColor: String {get set}
    var isEnabled: Bool {get set}
    var text: String {get set}
}
