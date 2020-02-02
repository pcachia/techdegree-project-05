//
//  SoundFunctions.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 5/29/19.
//  Copyright © 2020 Phil Cachia. All rights reserved.
//

import UIKit
import GameKit

// SOUNDS
// <--

class SoundManager {

    var soundAccessDenied: SystemSoundID = 0
    var soundAccessGranted: SystemSoundID = 1

    // function to load question correct sound
    func loadSoundAccessDenied() {
        let path = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundAccessDenied)
    }

    // function to start sound when game starts
    func playSoundAccessDenied() {
        AudioServicesPlaySystemSound(soundAccessDenied)
    }

    // function to load question wrong sound
    func loadSoundAccessGranted() {
        let path = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundAccessGranted)
    }

    // function to start sound when game starts
    func playSoundAccessGranted() {
        AudioServicesPlaySystemSound(soundAccessGranted)
    }

}
// -->
