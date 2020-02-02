//
//  ViewController.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 10/3/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var entrantType:String = ""

    // MARK: - auto fill data
    // function used to autofill enabled text fields
    @objc func populateFieldsAction(sender: UIButton!) {
        if dateOfBirthTextField.isEnabled == true {
            dateOfBirthTextField.text = "12-23-2001"
        }
        if socialSecurityNumberTextField.isEnabled == true {
            socialSecurityNumberTextField.text = "9876548989"
        }
        if projectTextField.isEnabled == true {
            projectTextField.text = "2001"
        }
        if firstNameTextField.isEnabled == true {
            firstNameTextField.text = "John"
        }
        if lastNameTextField.isEnabled == true {
            lastNameTextField.text = "Anderson"
        }
        if companyTextField.isEnabled == true {
            companyTextField.text = "Orca"
        }
        if streetAddressTextField.isEnabled == true {
            streetAddressTextField.text = "120 hall street"
        }
        if cityTextField.isEnabled == true {
            cityTextField.text = "testCity"
        }
        if stateTextField.isEnabled == true {
            stateTextField.text = "testState"
        }
        if zipCodeTextField.isEnabled == true {
            zipCodeTextField.text = "877655"
        }
    }

    // get sound manager instance
    var sound = SoundManager()

    @IBOutlet weak var TestSwipeButton: UIButton!
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
                
        // load sounds
        sound.loadSoundAccessDenied()
        sound.loadSoundAccessGranted()

        generateMainView()

        // Do any additional setup after loading the view.

          // MARK: - test Guest
//        //test Guest classic entrant
//        var guest = Guest(type: .classic)
//        let pass = Pass(areaAccess: [.amusement], rideAccess: [.allRides], discountAccess: [.food(value: 0.1), .merchandise(value: 0.2)])
//        guest.pass = pass
//        //Will fail because the entrant has no access to the kitchen
//        let kitchenResult = guest.swipe(for: .kitchen)
//        print(kitchenResult)
//        //Will succeed
//        let amusementResult = guest.swipe(for: .amusement)
//        print(amusementResult)
//        // checking rides
//        let ridesResult = guest.swipe(for: .allRides)
//        print(ridesResult)
//        let skipLineResult = guest.swipe(for: .skipLine)
//        print(skipLineResult)
//        // checking discounts
//        let food = guest.swipe(for: .food(value: 0.1))
//        print(food)
        
          // MARK: - test Employee
//        //test Employee Food services entrant
//        var guest = Employee(firstName: "John", lastName: "Smith", streetAddress: "56th avenue streeet", city: "some city", state: "Some state", zipCode: "AC1234", type: .foodServices)
//        let pass = Pass(areaAccess: [.amusement, .kitchen], rideAccess: [.allRides], discountAccess: [.food(value: 0.15), .merchandise(value: 0.25)])
//        guest.pass = pass
//        //Will fail because the entrant has no access to the kitchen
//        let kitchenResult = guest.swipe(for: .kitchen)
//        print(kitchenResult)
//        //Will succeed
//        let amusementResult = guest.swipe(for: .amusement)
//        print(amusementResult)
//        // checking rides
//        let ridesResult = guest.swipe(for: .allRides)
//        print(ridesResult)
//        let skipLineResult = guest.swipe(for: .skipLine)
//        print(skipLineResult)
//        // checking discounts, will fail cause double does not match
//        let food = guest.swipe(for: .food(value: 0.1))
//        print(food)

//          // MARK: - test Manager + BDay + 5secs
//        //test guest Manager
//        var guest = Manager(firstName: "John", lastName: "Smith", streetAddress: "56th avenue streeet", city: "some city", state: "Some state", zipCode: "AC1234", socialSecurityNumer: 123456, dateOfBirth: Dates.parse("2014-10-11"), type: .generalManager)
//        let pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], rideAccess: [.allRides], discountAccess: [.food(value: 0.25), .merchandise(value: 0.25)])
//        guest.pass = pass
//        // Will succeed
//        // MARK: - FOR TEST BUTTONS!!!!
//        let kitchenResult = guest.swipe(for: .kitchen)
//        print(kitchenResult)
//        // Will succeed
//        let amusementResult = guest.swipe(for: .amusement)
//        print(amusementResult)
//        // checking rides - succeed
//        let ridesResult = guest.swipe(for: .allRides)
//        print(ridesResult)
//        // will fail
//        let skipLineResult = guest.swipe(for: .skipLine)
//        print(skipLineResult)
//        // checking discounts - succeed
//        let food = guest.swipe(for: .food(value: 0.25))
//        print(food)
//        // if guest's birth month and day are same as today, succeeds
//        let hasBirthDay = guest.checkBirthday(for: guest.dateOfBirth)
//        print(hasBirthDay)
//        // if guest swipes within 5 seconds of a previous swipe it will print true (below 3 swipes that will seceed, not suceed, not succeed (false, true, true)
//        checkTimer(for: nil, birthday: false)
//        checkTimer(for: nil, birthday: false)
//        checkTimer(for: nil, birthday: false)
                
    }

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
    
    // testing with button
    @IBAction func testSwipe(_ sender: Any) {
        var guest = Manager(firstName: "John", lastName: "Smith", streetAddress: "56th avenue streeet", city: "some city", state: "Some state", zipCode: "AC1234", socialSecurityNumer: "123456", dateOfBirth: Dates.parse("2014-10-11"), type: .generalManager)
        let pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], rideAccess: [.allRides], discountAccess: [.food(value: 0.25), .merchandise(value: 0.25)])
        guest.pass = pass
        let hasBirthDay = guest.checkBirthday(for: guest.dateOfBirth)
        checkTimer(for: guest, birthday: hasBirthDay)
        // checking rides - succeed
        let ridesResult = guest.swipe(for: .allRides)
        print(ridesResult)
        // will fail
        let skipLineResult = guest.swipe(for: .skipLine)
        print(skipLineResult)
    }
            
    // MARK: - functions chosen submenu
    // the submenu to be generated from a clicked main menu button
    @objc func mainButtonGuestAction(sender: UIButton!) {
        generateGuestSubStackView()
    }
    @objc func mainButtonEmployeeAction(sender: UIButton!) {
      generateEmployeeSubStackView()
    }
    @objc func mainButtonManagerAction(sender: UIButton!) {
      generateManagerSubStackView()
    }
    @objc func mainButtonContractorAction(sender: UIButton!) {
      generateContractorSubStackView()
    }
    @objc func mainButtonVendorAction(sender: UIButton!) {
      generateVendorSubStackView()
    }
    
    // MARK: - Main View
    func generateMainView() {

        // will be used as guide to spilt the screen exactly
        let sectionHeightValue = (self.view.frame.height)/16
        
        // linking main menu buttons to functions
        guestMainView.addTarget(self, action: #selector(mainButtonGuestAction), for: .touchUpInside)
        employeeMainView.addTarget(self, action: #selector(mainButtonEmployeeAction), for: .touchUpInside)
        managerMainView.addTarget(self, action: #selector(mainButtonManagerAction), for: .touchUpInside)
        contractorMainView.addTarget(self, action: #selector(mainButtonContractorAction), for: .touchUpInside)
        vendorMainView.addTarget(self, action: #selector(mainButtonVendorAction), for: .touchUpInside)

        // Main menu buttons stack
        let stackMainMenu = UIStackView(arrangedSubviews: [guestMainView, employeeMainView, managerMainView, contractorMainView, vendorMainView])
        stackMainMenu.axis = .horizontal
        stackMainMenu.distribution = .fillEqually

        // add to view
        view.addSubview(stackMainMenu)

        // autolayout constraint
        stackMainMenu.translatesAutoresizingMaskIntoConstraints = false
        // Layoutconstraints for the main menu stack
        NSLayoutConstraint.activate([stackMainMenu.topAnchor.constraint(equalTo: view.topAnchor), stackMainMenu.leftAnchor.constraint(equalTo: view.leftAnchor), stackMainMenu.rightAnchor.constraint(equalTo: view.rightAnchor), stackMainMenu.heightAnchor.constraint(equalToConstant: sectionHeightValue * 2)])

        // empty stack which will be replaced with a sub menu
        let emptyView = UIView()
        emptyView.backgroundColor = .gray
        // Layoutconstraints for the empty stack / sub menu
        let stackSubView = UIStackView(arrangedSubviews: [emptyView])
          stackSubView.axis = .horizontal
          stackSubView.distribution = .fillEqually

        // add to view
        view.addSubview(stackSubView)

        // autolayout constraint
        stackSubView.translatesAutoresizingMaskIntoConstraints = false
        // Layoutconstraints for the sub menu
        NSLayoutConstraint.activate([stackSubView.topAnchor.constraint(equalTo: stackMainMenu.bottomAnchor, constant: 0), stackSubView.leftAnchor.constraint(equalTo: view.leftAnchor), stackSubView.rightAnchor.constraint(equalTo: view.rightAnchor), stackSubView.heightAnchor.constraint(equalToConstant: sectionHeightValue)])

        // Main View Stacks
        let stackEntrantDetails01Labels: UIStackView = UIStackView(arrangedSubviews: [dateOfBirthLabel, socialSecurityNumerLabel, projectLabel])
        stackEntrantDetails01Labels.customUIStackViewProperties()
        let stackEntrantDetails01TextFields: UIStackView = UIStackView(arrangedSubviews: [dateOfBirthTextField, socialSecurityNumberTextField, projectTextField])
        stackEntrantDetails01TextFields.customUIStackViewProperties()
        let stackEntrantDetails02Labels: UIStackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel])
        stackEntrantDetails02Labels.customUIStackViewProperties()
        let stackEntrantDetails02TextFields: UIStackView = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField])
        stackEntrantDetails02TextFields.customUIStackViewProperties()
        let stackEntrantDetails03Labels: UIStackView = UIStackView(arrangedSubviews: [cityLabel, stateLabel, zipCodeLabel])
        stackEntrantDetails03Labels.customUIStackViewProperties()
        let stackEntrantDetails03TextFields: UIStackView = UIStackView(arrangedSubviews: [cityTextField, stateTextField, zipCodeTextField])
        stackEntrantDetails03TextFields.customUIStackViewProperties()
        let stackEntrantButtons: UIStackView = UIStackView(arrangedSubviews: [generatePassButton, populateDataButton])
        stackEntrantButtons.customUIStackViewProperties()

        // linking submit buttons to functions
        generatePassButton.addTarget(self, action: #selector(generatePass), for: .touchUpInside)
        populateDataButton.addTarget(self, action: #selector(populateFieldsAction), for: .touchUpInside)

        // add all stacks to view
        view.addSubview(stackEntrantDetails01Labels)
        view.addSubview(stackEntrantDetails01TextFields)
        view.addSubview(stackEntrantDetails02Labels)
        view.addSubview(stackEntrantDetails02TextFields)
        view.addSubview(companyLabel)
        view.addSubview(companyTextField)
        view.addSubview(streetAddressLabel)
        view.addSubview(streetAddressTextField)
        view.addSubview(stackEntrantDetails03Labels)
        view.addSubview(stackEntrantDetails03TextFields)
        view.addSubview(stackEntrantButtons)
        
        // Layoutconstraints for all stacks
        NSLayoutConstraint.activate([stackEntrantDetails01Labels.topAnchor.constraint(equalTo: stackSubView.bottomAnchor, constant: 0), stackEntrantDetails01Labels.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), stackEntrantDetails01Labels.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8), stackEntrantDetails01Labels.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([stackEntrantDetails01TextFields.topAnchor.constraint(equalTo: stackEntrantDetails01Labels.bottomAnchor, constant: 0), stackEntrantDetails01TextFields.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), stackEntrantDetails01TextFields.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8), stackEntrantDetails01TextFields.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([stackEntrantDetails02Labels.topAnchor.constraint(equalTo: stackEntrantDetails01TextFields.bottomAnchor, constant: 0), stackEntrantDetails02Labels.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), stackEntrantDetails02Labels.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8), stackEntrantDetails02Labels.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
         NSLayoutConstraint.activate([stackEntrantDetails02TextFields.topAnchor.constraint(equalTo: stackEntrantDetails02Labels.bottomAnchor, constant: 0), stackEntrantDetails02TextFields.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), stackEntrantDetails02TextFields.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8), stackEntrantDetails02TextFields.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([companyLabel.topAnchor.constraint(equalTo: stackEntrantDetails02TextFields.bottomAnchor, constant: 0), companyLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),  companyLabel.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([companyTextField.topAnchor.constraint(equalTo: companyLabel.bottomAnchor, constant: 0), companyTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), companyTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(self.view.frame.width)/3*2),
            companyTextField.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([streetAddressLabel.topAnchor.constraint(equalTo: companyTextField.bottomAnchor, constant: 0), streetAddressLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),  streetAddressLabel.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([streetAddressTextField.topAnchor.constraint(equalTo: streetAddressLabel.bottomAnchor, constant: 0), streetAddressTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), streetAddressTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(self.view.frame.width)/3*2),
            streetAddressTextField.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([stackEntrantDetails03Labels.topAnchor.constraint(equalTo: streetAddressTextField.bottomAnchor, constant: 0), stackEntrantDetails03Labels.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), stackEntrantDetails03Labels.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8), stackEntrantDetails03Labels.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([stackEntrantDetails03TextFields.topAnchor.constraint(equalTo: stackEntrantDetails03Labels.bottomAnchor, constant: 0), stackEntrantDetails03TextFields.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), stackEntrantDetails03TextFields.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8), stackEntrantDetails03TextFields.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
        NSLayoutConstraint.activate([stackEntrantButtons.topAnchor.constraint(equalTo: stackEntrantDetails03TextFields.bottomAnchor, constant: sectionHeightValue), stackEntrantButtons.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), stackEntrantButtons.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8), stackEntrantButtons.heightAnchor.constraint(equalToConstant: sectionHeightValue * 1)])
        NSLayoutConstraint.activate([stackEntrantButtons.topAnchor.constraint(equalTo: stackEntrantDetails03TextFields.bottomAnchor, constant: sectionHeightValue), stackEntrantButtons.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8), stackEntrantButtons.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8), stackEntrantButtons.heightAnchor.constraint(equalToConstant: sectionHeightValue * 1)])
    }
    
    // MARK: - Sub Menu Stack Guest
    func generateGuestSubStackView() {
        disableAllTextFields()
        
        // linking Sub Menu buttons to functions
        guestClassicSubView.addTarget(self, action: #selector(subMenuGuestClassic), for: .touchUpInside)
        guestVipSubView.addTarget(self, action: #selector(subMenuGuestVIP), for: .touchUpInside)
        guestChildSubView.addTarget(self, action: #selector(subMenuGuestFreeChild), for: .touchUpInside)
        guestSeasonSubView.addTarget(self, action: #selector(subMenuGuestSeasonPass), for: .touchUpInside)
        guestSeniorSubView.addTarget(self, action: #selector(subMenuGuestSenior), for: .touchUpInside)

        // sub menu buttons stack
        let stackSubView = UIStackView(arrangedSubviews: [guestClassicSubView, guestVipSubView, guestChildSubView, guestSeasonSubView, guestSeniorSubView])
        stackSubView.axis = .horizontal
        stackSubView.distribution = .fillEqually

        // add stack to view
        view.addSubview(stackSubView)

        // autolayout constraint
        stackSubView.translatesAutoresizingMaskIntoConstraints = false
        
        let sectionHeightValue = (self.view.frame.height)/16

        // Layoutconstraints for the sub menu
        NSLayoutConstraint.activate([stackSubView.topAnchor.constraint(equalTo: view.topAnchor, constant: sectionHeightValue * 2), stackSubView.leftAnchor.constraint(equalTo: view.leftAnchor), stackSubView.rightAnchor.constraint(equalTo: view.rightAnchor), stackSubView.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
    }
    // MARK: - Sub Menu Stack Employee
    func generateEmployeeSubStackView() {
        disableAllTextFields()
        
        // linking Sub Menu buttons to functions
        employeeFoodServicesSubView.addTarget(self, action: #selector(subMenuEmployeeFood), for: .touchUpInside)
        employeeRideServicesSubView.addTarget(self, action: #selector(subMenuEmployeeRide), for: .touchUpInside)
        employeeMaintenanceSubView.addTarget(self, action: #selector(subMenuEmployeeMaintenance), for: .touchUpInside)

        // sub menu buttons stack
        let stackSubView = UIStackView(arrangedSubviews: [employeeFoodServicesSubView, employeeRideServicesSubView, employeeMaintenanceSubView])
        stackSubView.axis = .horizontal
        stackSubView.distribution = .fillEqually

        // add stack to view
        view.addSubview(stackSubView)

        // autolayout constraint
        stackSubView.translatesAutoresizingMaskIntoConstraints = false
         
        let sectionHeightValue = (self.view.frame.height)/16
        
        // Layoutconstraints for the sub menu
        NSLayoutConstraint.activate([stackSubView.topAnchor.constraint(equalTo: view.topAnchor, constant: sectionHeightValue * 2), stackSubView.leftAnchor.constraint(equalTo: view.leftAnchor), stackSubView.rightAnchor.constraint(equalTo: view.rightAnchor), stackSubView.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
    }
    // MARK: - Sub Menu Stack Manager
    func generateManagerSubStackView() {
        disableAllTextFields()
        
        // linking Sub Menu buttons to functions
        managerSeniorSubView.addTarget(self, action: #selector(subMenuManagerSenior), for: .touchUpInside)
        managerGeneralSubView.addTarget(self, action: #selector(subMenuManagerGeneral), for: .touchUpInside)
        managerShiftSubView.addTarget(self, action: #selector(subMenuManagerShift), for: .touchUpInside)

        // sub menu buttons stack
        let stackSubView = UIStackView(arrangedSubviews: [managerSeniorSubView, managerGeneralSubView, managerShiftSubView])
        stackSubView.axis = .horizontal
        stackSubView.distribution = .fillEqually

        // add stack to view
        view.addSubview(stackSubView)

        // autolayout constraint
        stackSubView.translatesAutoresizingMaskIntoConstraints = false

        let sectionHeightValue = (self.view.frame.height)/16
          
        // Layoutconstraints for the sub menu
        NSLayoutConstraint.activate([stackSubView.topAnchor.constraint(equalTo: view.topAnchor, constant: sectionHeightValue * 2), stackSubView.leftAnchor.constraint(equalTo: view.leftAnchor), stackSubView.rightAnchor.constraint(equalTo: view.rightAnchor), stackSubView.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
    }
    // MARK: - Sub Menu Stack Contractor
    func generateContractorSubStackView() {
        disableAllTextFields()
        
        // linking Sub Menu buttons to functions
        contractorSubView.addTarget(self, action: #selector(subMenuContractor), for: .touchUpInside)

        // sub menu buttons stack
        let stackSubView = UIStackView(arrangedSubviews: [contractorSubView])
        stackSubView.axis = .horizontal
        stackSubView.distribution = .fillEqually
        
        // add stack to view
        view.addSubview(stackSubView)

        // autolayout constraint
        stackSubView.translatesAutoresizingMaskIntoConstraints = false

        let sectionHeightValue = (self.view.frame.height)/16
            
        // Layoutconstraints for the sub menu
        NSLayoutConstraint.activate([stackSubView.topAnchor.constraint(equalTo: view.topAnchor, constant: sectionHeightValue * 2), stackSubView.leftAnchor.constraint(equalTo: view.leftAnchor), stackSubView.rightAnchor.constraint(equalTo: view.rightAnchor), stackSubView.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
    }
    // MARK: - Sub Menu Stack Vendor
    func generateVendorSubStackView() {
        disableAllTextFields()
        
        // linking Sub Menu buttons to functions
        vendorSubView.addTarget(self, action: #selector(subMenuVendor), for: .touchUpInside)

        // sub menu buttons stack
        let stackSubView = UIStackView(arrangedSubviews: [vendorSubView])
        stackSubView.axis = .horizontal
        stackSubView.distribution = .fillEqually

        // add stack to view
        view.addSubview(stackSubView)

        // autolayout constraint
        stackSubView.translatesAutoresizingMaskIntoConstraints = false

        let sectionHeightValue = (self.view.frame.height)/16
         
        // Layoutconstraints for the sub menu
        NSLayoutConstraint.activate([stackSubView.topAnchor.constraint(equalTo: view.topAnchor, constant: sectionHeightValue * 2), stackSubView.leftAnchor.constraint(equalTo: view.leftAnchor), stackSubView.rightAnchor.constraint(equalTo: view.rightAnchor), stackSubView.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
    }
    
    // MARK: - Which text fields are needed
    // dipending on which sub button is pressed
    @objc func subMenuGuestClassic(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: false, enableAddressTextFields: false, enableSocialSecurityNumberTextField: false, enableDateOfBirthTextField: false, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "classic"
    }
    @objc func subMenuGuestVIP(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: false, enableAddressTextFields: false, enableSocialSecurityNumberTextField: false, enableDateOfBirthTextField: false, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "vip"
     }
    @objc func subMenuGuestFreeChild(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: false, enableAddressTextFields: false, enableSocialSecurityNumberTextField: false, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "freeChild"
    }
    @objc func subMenuGuestSeasonPass(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: true, enableSocialSecurityNumberTextField: false, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "season"
    }
    @objc func subMenuGuestSenior(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: false, enableSocialSecurityNumberTextField: false, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "senior"
    }
    @objc func subMenuEmployeeFood(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: true, enableSocialSecurityNumberTextField: true, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "foodServices"
    }
    @objc func subMenuEmployeeRide(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: true, enableSocialSecurityNumberTextField: true, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "rideServices"
    }
    @objc func subMenuEmployeeMaintenance(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: true, enableSocialSecurityNumberTextField: true, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "maintenance"
    }
    @objc func subMenuManagerSenior(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: true, enableSocialSecurityNumberTextField: true, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "seniorManager"
    }
    @objc func subMenuManagerGeneral(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: true, enableSocialSecurityNumberTextField: true, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "generalManager"
    }
    @objc func subMenuManagerShift(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: true, enableSocialSecurityNumberTextField: true, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "shiftManager"
    }
    @objc func subMenuContractor(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: true, enableSocialSecurityNumberTextField: true, enableDateOfBirthTextField: true, enableProjectNameTextField: true, enableVendorNameTextField: false)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "contractEmployee"
    }
    @objc func subMenuVendor(sender: UIButton!) {
        let activeForm = UsableTextFields(enableNameableTextFields: true, enableAddressTextFields: false, enableSocialSecurityNumberTextField: false, enableDateOfBirthTextField: true, enableProjectNameTextField: false, enableVendorNameTextField: true)
        activateUsableTextFields(usableTextFields: activeForm)
        entrantType = "vendor"
    }
    // MARK: - Enable needed text fields
    func activateUsableTextFields(usableTextFields: UsableTextFields) {
        disableAllTextFields()
        if usableTextFields.enableNameableTextFields == true {
            firstNameTextField.UITextFieldEnabled()
            lastNameTextField.UITextFieldEnabled()
        }
        if usableTextFields.enableAddressTextFields == true {
            streetAddressTextField.UITextFieldEnabled()
            cityTextField.UITextFieldEnabled()
            stateTextField.UITextFieldEnabled()
            zipCodeTextField.UITextFieldEnabled()
        }
        if usableTextFields.enableSocialSecurityNumberTextField == true {
            socialSecurityNumberTextField.UITextFieldEnabled()
        }
        if usableTextFields.enableDateOfBirthTextField == true {
            dateOfBirthTextField.UITextFieldEnabled()
        }
        if usableTextFields.enableProjectNameTextField == true {
            projectTextField.UITextFieldEnabled()
        }
        if usableTextFields.enableVendorNameTextField == true {
            companyTextField.UITextFieldEnabled()
        }
    }
    // MARK: - Disable all fields
    func disableAllTextFields() {
        dateOfBirthTextField.UITextFieldDisabled()
        socialSecurityNumberTextField.UITextFieldDisabled()
        projectTextField.UITextFieldDisabled()
        firstNameTextField.UITextFieldDisabled()
        lastNameTextField.UITextFieldDisabled()
        companyTextField.UITextFieldDisabled()
        streetAddressTextField.UITextFieldDisabled()
        cityTextField.UITextFieldDisabled()
        stateTextField.UITextFieldDisabled()
        zipCodeTextField.UITextFieldDisabled()
    }

    // MARK: - Second View
    let secondView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

    // MARK: - create pass
    @IBAction func createPass(sender: UIButton!) {
        // actually this only removes the second view, but it simulates that the data has been passed
        secondView.removeFromSuperview()
    }
    
    // MARK: - generate pass
    @IBAction func generatePass(sender: UIButton!) {
        
        var entrant: Entrant
        var pass: Pass
        
        // struct that generates all the data that has to be passed
        let passFormData: ValidationError? = validateForm(
            createPassModel: FormValidationModel(
                formDateOfBirth: dateOfBirthTextField.text,
                formDateOfBirthEnabled: dateOfBirthTextField.isEnabled,
                formSocialSecurityNumber: socialSecurityNumberTextField.text,
                formSocialSecurityNumberEnabled: socialSecurityNumberTextField.isEnabled,
                formProject: projectTextField.text,
                formProjectEnabled: projectTextField.isEnabled,
                formFirstName: firstNameTextField.text,
                formFirstNameEnabled: firstNameTextField.isEnabled,
                formLastName: lastNameTextField.text,
                formLastNameEnabled: lastNameTextField.isEnabled,
                formCompany: companyTextField.text,
                formCompanyEnabled: companyTextField.isEnabled,
                formStreetAddress: streetAddressTextField.text,
                formStreetAddressEnabled: streetAddressTextField.isEnabled,
                formCity: cityTextField.text,
                formCityEnabled: cityTextField.isEnabled,
                formState: stateTextField.text,
                formStateEnabled: streetAddressTextField.isEnabled,
                formZipCode: zipCodeTextField.text,
                formZipCodeEnabled: zipCodeTextField.isEnabled
                
            )
        )
                
        // check if there are any errors
        // else generate next view
        if passFormData != nil {

            let errorCode = "Error Code \(String(passFormData!.errorCode))"
            let errorString = passFormData?.errorString
            
            let alert = UIAlertController(title: errorCode, message: errorString, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            // checxking which data to pass from entrant type
            switch entrantType {
            case "classic":
                pass = Pass(areaAccess: [.amusement], rideAccess: [.allRides], discountAccess: [])
                entrant = Guest(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, dateOfBirth: nil, type: .classic, pass: pass)
            case "vip":
                pass = Pass(areaAccess: [.amusement], rideAccess: [.allRides, .skipLine], discountAccess: [.food(value: 0.10), .merchandise(value: 0.20)])
                entrant = Guest(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, dateOfBirth: nil, type: .vip, pass: pass)
            case "freeChild":
                pass = Pass(areaAccess: [.amusement], rideAccess: [.allRides, .skipLine], discountAccess: [])
                entrant = Guest(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .freeChild, pass: pass)
            case "season":
                pass = Pass(areaAccess: [.amusement], rideAccess: [.allRides, .skipLine], discountAccess: [.food(value: 0.10), .merchandise(value: 0.20)])
                entrant = Guest(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: nil, city: nil, state: nil, zipCode: nil, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .season, pass: pass)
            case "senior":
                pass = Pass(areaAccess: [.amusement], rideAccess: [.allRides, .skipLine], discountAccess: [.food(value: 0.10), .merchandise(value: 0.10)])
                entrant = Guest(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .season, pass: pass)
            case "foodServices":
                pass = Pass(areaAccess: [.amusement, .kitchen], rideAccess: [.allRides], discountAccess: [.food(value: 0.15), .merchandise(value: 0.25)])
                entrant = Employee(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, socialSecurityNumer: socialSecurityNumberTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .foodServices, pass: pass)
            case "rideServices":
                pass = Pass(areaAccess: [.amusement, .rideControl], rideAccess: [.allRides], discountAccess: [.food(value: 0.15), .merchandise(value: 0.25)])
                entrant = Employee(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, socialSecurityNumer: socialSecurityNumberTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .rideServices, pass: pass)
            case "maintenance":
                pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance], rideAccess: [.allRides], discountAccess: [.food(value: 0.15), .merchandise(value: 0.25)])
                entrant = Employee(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, socialSecurityNumer: socialSecurityNumberTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .maintenance, pass: pass)
            case "seniorManager":
                pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], rideAccess: [.allRides], discountAccess: [.food(value: 0.25), .merchandise(value: 0.25)])
                entrant = Manager(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, socialSecurityNumer: socialSecurityNumberTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .seniorManager, pass: pass)
            case "generalManager":
                pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], rideAccess: [.allRides], discountAccess: [.food(value: 0.25), .merchandise(value: 0.25)])
                entrant = Manager(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, socialSecurityNumer: socialSecurityNumberTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .generalManager, pass: pass)
            case "shiftManager":
                pass = Pass(areaAccess: [.amusement, .kitchen, .rideControl, .maintenance, .office], rideAccess: [.allRides], discountAccess: [.food(value: 0.25), .merchandise(value: 0.25)])
                entrant = Manager(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, socialSecurityNumer: socialSecurityNumberTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), type: .shiftManager, pass: pass)
            case "contractor":
                pass = Pass(areaAccess: [.amusement, .kitchen], rideAccess: [], discountAccess: [])
                entrant = Contractor(firstName: firstNameTextField.text, lastName: lastNameTextField.text, streetAddress: streetAddressTextField.text, city: cityTextField.text, state: stateTextField.text, zipCode: zipCodeTextField.text, socialSecurityNumer: socialSecurityNumberTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), projectName: projectTextField.text, dateOfVisit: Dates.parse(String(todaysDate())), type: .contractEmployee , pass: pass)
            case "vendor":
                pass = Pass(areaAccess: [.amusement, .kitchen], rideAccess: [], discountAccess: [])
                entrant = Vendor(firstName: firstNameTextField.text, lastName: lastNameTextField.text, dateOfBirth: Dates.parse(String(dateOfBirthTextField.text!)), vendorName: companyTextField.text, dateOfVisit: Dates.parse(String(todaysDate())), type: .vendor , pass: pass)
            default:
                pass = Pass(areaAccess: [.amusement], rideAccess: [.allRides], discountAccess: [])
                entrant = Guest(firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil, dateOfBirth: nil, type: .classic, pass: pass)
            }

            // Change UIView background colour
            secondView.backgroundColor = UIColor.lightGray

            // Add rounded corners to UIView
            secondView.layer.cornerRadius = 0

            // Add border to UIView
            secondView.layer.borderWidth = 0

            // Change UIView Border Color to Red
            // myNewView.layer.borderColor = UIColor.red.cgColor

            // Add UIView as a Subview
            self.view.addSubview(secondView)
                    
            let viewHeight = (self.view.frame.height)
            let viewWidth = (self.view.frame.width)
            
            // contructing entrant information
            var entrantInfo: String = ""
            if firstNameTextField.isEnabled == true {
                entrantInfo += "\(String(firstNameTextField.text!)) \(String(lastNameTextField.text!))\n"
            }
            if dateOfBirthLabel.isEnabled == true {
                entrantInfo += "\(String(dateOfBirthTextField.text!))\n"
            }
            if socialSecurityNumberTextField.isEnabled == true {
                entrantInfo += "\(String(socialSecurityNumberTextField.text!))\n"
            }
            if projectTextField.isEnabled == true {
                entrantInfo += "\(String(projectTextField.text!))\n"
            }
            if companyTextField.isEnabled == true {
                entrantInfo += "\(String(companyTextField.text!))\n"
            }
            if streetAddressTextField.isEnabled == true {
                entrantInfo += "\(String(streetAddressTextField.text!)), \(String(cityTextField.text!)), \(String(stateTextField.text!)), \(String(zipCodeTextField.text!))"
            }
            
            // display labels for entrant created pass
            entrantImage.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            entrantInfoLabel.text = entrantInfo
            emptyLabel.text = nil

            // stcks for second view
            let stackEntrantDetailsLabels: UIStackView = UIStackView(arrangedSubviews: [entrantImage, entrantInfoLabel, emptyLabel])
            stackEntrantDetailsLabels.customUIStackViewProperties()
            stackEntrantDetailsLabels.setCustomSpacing(viewWidth/100*3, after: entrantImage)
            stackEntrantDetailsLabels.setCustomSpacing(viewWidth/100*3, after: entrantInfoLabel)
            let stackEntrantAccessTestButtonsA: UIStackView = UIStackView(arrangedSubviews: [officeTestButton, kitchenTestButton, ridesControlTestButton, amusementTestButton])
            stackEntrantAccessTestButtonsA.customUIStackViewProperties()
            stackEntrantAccessTestButtonsA.setCustomSpacing(viewWidth/100*3, after: officeTestButton)
            stackEntrantAccessTestButtonsA.setCustomSpacing(viewWidth/100*3, after: kitchenTestButton)
            stackEntrantAccessTestButtonsA.setCustomSpacing(viewWidth/100*3, after: ridesControlTestButton)
            let stackEntrantAccessTestButtonsB: UIStackView = UIStackView(arrangedSubviews: [ridesTestButton, foodDiscountTestButton, mercDiscountTestButton, maintenanceTestButton])
            stackEntrantAccessTestButtonsB.customUIStackViewProperties()
            stackEntrantAccessTestButtonsB.setCustomSpacing(viewWidth/100*3, after: ridesTestButton)
            stackEntrantAccessTestButtonsB.setCustomSpacing(viewWidth/100*3, after: foodDiscountTestButton)
            stackEntrantAccessTestButtonsB.setCustomSpacing(viewWidth/100*3, after: mercDiscountTestButton)
            
            stackEntrantDetailsLabels.spacing = UIStackView.spacingUseDefault
            
            // linking create button to function
            createPassButton.addTarget(self, action: #selector(createPass), for: .touchUpInside)
            
            // adding stack to second view
            secondView.addSubview(createNewPass)
            secondView.addSubview(stackEntrantDetailsLabels)
            secondView.addSubview(accessTesting)
            secondView.addSubview(accessTestingInfo)
            secondView.addSubview(stackEntrantAccessTestButtonsA)
            secondView.addSubview(stackEntrantAccessTestButtonsB)
            secondView.addSubview(testAccessLabel)
            secondView.addSubview(createPassButton)

            // contraints for stacks
            NSLayoutConstraint.activate([createNewPass.topAnchor.constraint(equalTo: view.topAnchor, constant: 0), createNewPass.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0), createNewPass.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -0), createNewPass.heightAnchor.constraint(equalToConstant: viewHeight/100*5)])
            NSLayoutConstraint.activate([stackEntrantDetailsLabels.topAnchor.constraint(equalTo: createNewPass.bottomAnchor, constant: viewHeight/100*2), stackEntrantDetailsLabels.leftAnchor.constraint(equalTo: view.leftAnchor, constant: viewWidth/100*5), stackEntrantDetailsLabels.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -viewWidth/100*5), stackEntrantDetailsLabels.heightAnchor.constraint(equalToConstant: viewHeight/100*23)])
            NSLayoutConstraint.activate([accessTesting.topAnchor.constraint(equalTo: stackEntrantDetailsLabels.bottomAnchor, constant: viewHeight/100*5), accessTesting.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0), accessTesting.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -0), accessTesting.heightAnchor.constraint(equalToConstant: viewHeight/100*2)])
            NSLayoutConstraint.activate([accessTestingInfo.topAnchor.constraint(equalTo: accessTesting.bottomAnchor, constant: viewHeight/100*1), accessTestingInfo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0), accessTestingInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -0), accessTestingInfo.heightAnchor.constraint(equalToConstant: viewHeight/100*2)])
            NSLayoutConstraint.activate([stackEntrantAccessTestButtonsA.topAnchor.constraint(equalTo: accessTestingInfo.bottomAnchor, constant: viewHeight/100*3), stackEntrantAccessTestButtonsA.leftAnchor.constraint(equalTo: view.leftAnchor, constant: viewWidth/100*15), stackEntrantAccessTestButtonsA.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -viewWidth/100*15), stackEntrantAccessTestButtonsA.heightAnchor.constraint(equalToConstant: viewHeight/100*4)])
            NSLayoutConstraint.activate([stackEntrantAccessTestButtonsB.topAnchor.constraint(equalTo: stackEntrantAccessTestButtonsA.bottomAnchor, constant: viewHeight/100*2), stackEntrantAccessTestButtonsB.leftAnchor.constraint(equalTo: view.leftAnchor, constant: viewWidth/100*15), stackEntrantAccessTestButtonsB.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -viewWidth/100*15), stackEntrantAccessTestButtonsB.heightAnchor.constraint(equalToConstant: viewHeight/100*4)])
            NSLayoutConstraint.activate([testAccessLabel.topAnchor.constraint(equalTo: stackEntrantAccessTestButtonsB.bottomAnchor, constant: viewHeight/100*2), testAccessLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: viewWidth/100*15), testAccessLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -viewWidth/100*15), testAccessLabel.heightAnchor.constraint(equalToConstant: viewHeight/100*30)])
            NSLayoutConstraint.activate([createPassButton.topAnchor.constraint(equalTo: testAccessLabel.bottomAnchor, constant: viewHeight/100*4), createPassButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: viewWidth/100*25), createPassButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -viewWidth/100*25), createPassButton.heightAnchor.constraint(equalToConstant: viewHeight/100*6)])
            
            // checks if entrant hass access to specified areas
            let officeResult = entrant.swipe(for: .office)
            if officeResult == true {
                officeTestButton.addTarget(self, action: #selector(AccessTestTrue), for: .touchUpInside)
            } else {
                officeTestButton.addTarget(self, action: #selector(AccessTestFalse), for: .touchUpInside)
            }
            let kitchenResult = entrant.swipe(for: .kitchen)
            if kitchenResult == true {
                kitchenTestButton.addTarget(self, action: #selector(AccessTestTrue), for: .touchUpInside)
            } else {
                kitchenTestButton.addTarget(self, action: #selector(AccessTestFalse), for: .touchUpInside)
            }
            let rideControlResult = entrant.swipe(for: .rideControl)
            if rideControlResult == true {
                ridesControlTestButton.addTarget(self, action: #selector(AccessTestTrue), for: .touchUpInside)
            } else {
                ridesControlTestButton.addTarget(self, action: #selector(AccessTestFalse), for: .touchUpInside)
            }
            let amusementResult = entrant.swipe(for: .amusement)
            if amusementResult == true {
                amusementTestButton.addTarget(self, action: #selector(AccessTestTrue), for: .touchUpInside)
            } else {
                amusementTestButton.addTarget(self, action: #selector(AccessTestFalse), for: .touchUpInside)
            }
            let ridesResult = entrant.swipe(for: .allRides)
            if ridesResult == true {
                ridesTestButton.addTarget(self, action: #selector(AccessTestTrue), for: .touchUpInside)
            } else {
                ridesTestButton.addTarget(self, action: #selector(AccessTestFalse), for: .touchUpInside)
            }
            let discounts = pass.discountAccess.count
            if discounts > 0 {
                foodDiscountTestButton.addTarget(self, action: #selector(DiscountTestTrue), for: .touchUpInside)
            } else {
                foodDiscountTestButton.addTarget(self, action: #selector(DiscountTestFalse), for: .touchUpInside)
            }
            if discounts > 0 {
                mercDiscountTestButton.addTarget(self, action: #selector(DiscountTestTrue), for: .touchUpInside)
            } else {
                mercDiscountTestButton.addTarget(self, action: #selector(DiscountTestFalse), for: .touchUpInside)
            }
            let maintenanceResult = entrant.swipe(for: .maintenance)
            if maintenanceResult == true {
                maintenanceTestButton.addTarget(self, action: #selector(AccessTestTrue), for: .touchUpInside)
            } else {
                maintenanceTestButton.addTarget(self, action: #selector(AccessTestFalse), for: .touchUpInside)
            }
        }
    }
    // functions that change the textlabel depending on the access result
    @objc func AccessTestTrue(sender: UIButton!) {
        testAccessLabel.text = "Access Granted"
        testAccessLabel.font =  UIFont(name: "Arial", size: 48.0)
        testAccessLabel.backgroundColor = .green
        testAccessLabel.textColor = .white
        sound.playSoundAccessGranted()
    }
    @objc func AccessTestFalse(sender: UIButton!) {
        testAccessLabel.text = "Access Denied"
        testAccessLabel.font =  UIFont(name: "Arial", size: 48.0)
        testAccessLabel.backgroundColor = .red
        testAccessLabel.textColor = .white
        sound.playSoundAccessDenied()
    }
    @objc func DiscountTestTrue(sender: UIButton!) {
        testAccessLabel.text = "Has Discount"
        testAccessLabel.font =  UIFont(name: "Arial", size: 48.0)
        testAccessLabel.backgroundColor = .green
        testAccessLabel.textColor = .white
        sound.playSoundAccessGranted()
    }
    @objc func DiscountTestFalse(sender: UIButton!) {
        testAccessLabel.text = "Does not have discount"
        testAccessLabel.font =  UIFont(name: "Arial", size: 48.0)
        testAccessLabel.backgroundColor = .red
        testAccessLabel.textColor = .white
        sound.playSoundAccessDenied()
    }

}
