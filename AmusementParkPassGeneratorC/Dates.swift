//
//  Dates.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/11/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import Foundation

class Dates {

//    class func from(year: Int, month: Int, day: Int) -> Date {
//        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
//
//        var dateComponents = DateComponents()
//        dateComponents.year = year
//        dateComponents.month = month
//        dateComponents.day = day
//
//        let date = gregorianCalendar.date(from: dateComponents)!
//        return date
//    }

    class func parse(_ string: String, format: String = "MM-dd-yyyy") -> Date {
        // getting entrant's birthdate
        let dateFormatterEntrant = DateFormatter()
        dateFormatterEntrant.timeZone = NSTimeZone.init(abbreviation: "GMT") as TimeZone?
        dateFormatterEntrant.dateFormat = format
        let date = dateFormatterEntrant.date(from: string)!

        return date
    }

}

//var date = Dates.parse("2014-05-20")
//var date = Dates.from(year: 2014, month: 05, day: 20)


func todaysDate() -> String {
    let date = Date()
    let formatter = DateFormatter()
    //Give the format you want to the formatter:

    formatter.dateFormat = "MM-dd-yyyy"
    //Get the result string:

    let result = formatter.string(from: date)
    //Set your label:

    return result
}
