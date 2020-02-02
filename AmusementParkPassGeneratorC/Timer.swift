//
//  Timer.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 12/26/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import Foundation

// MARK: - 5 Seconds Swipe Disable + Birthday check
// TIMER -->
// Variable that will hold a starting value of round seconds.
var seconds: Int = 5
// variable to store the timer instance
var timer = Timer()
// This will be used to make sure only one timer is created at a time.
var isTimerRunning = false
// function to start to run timer, function updateTimer() trigers every second
func runTimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
}
// function to update timer
@objc func updateTimer() {
    // Decrements (count down) the seconds.
    seconds -= 1
    // if seconds is 0:
        // update TimerLabel.text with current seconds
        // stop timer
        // indicate that timer is currently not running
        // hide all arrow buttons
        // check if round answers if they are correct
        print("\(seconds) seconds left")
    // else :
        // update TimerLabel.text with current seconds
    if seconds == 0 {
        timer.invalidate()
        isTimerRunning = false
        resetTimer()
    }
}
// function to reset timer
func resetTimer() {
    // reset seconds
    seconds = 5
    // run timer
    timer = Timer()
    // set timer is running to true
    isTimerRunning = false
}

// remove entrant questionmark on part two (used for data testing)
func checkTimer(for entrant: Entrant?, birthday: Bool) {
    if isTimerRunning == true  {
        // remove if else on part two (used for data testing)
        if entrant == nil {
            print("swipe function locked! - TRUE")
        } else {
            //print("cannot run function while timer is running")
            // create the alert
            let alert = UIAlertController(title: "Already swiped", message: "You have already swiped this location, you may be able to swipe again at a later time.", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
    } else {
        print("Swipe function running - FALSE")
        isTimerRunning = true
        runTimer()
        if birthday == true {
            // create the alert
            let alert = UIAlertController(title: "Happy Birthday!", message: "Wish you a great birthday at your favorite amusement park.", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
}
