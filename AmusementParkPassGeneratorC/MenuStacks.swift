//
//  MenuStacks.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 12/26/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//

import UIKit

   // MARK: - Sub Stack Guest
   func generateGuestSubStackView() {
       
       let guestClassicSubView = UIButton()
       guestClassicSubView.customSubMenuUIButtonProperties()
       guestClassicSubView.setTitle("Classic", for: .normal)
    guestClassicSubView.addTarget(ViewController.self, action: #selector(print("ok")), for: .touchUpInside)

       let guestVipSubView = UIButton()
       guestVipSubView.customSubMenuUIButtonProperties()
       guestVipSubView.setTitle("VIP", for: .normal)
       guestVipSubView.addTarget(self, action: #selector(mainButtonGuestAction), for: .touchUpInside)

       let guestChildSubView = UIButton()
       guestChildSubView.customSubMenuUIButtonProperties()
       guestChildSubView.setTitle("Free Child", for: .normal)
       guestChildSubView.addTarget(self, action: #selector(mainButtonGuestAction), for: .touchUpInside)

       let guestSeasonSubView = UIButton()
       guestSeasonSubView.customSubMenuUIButtonProperties()
       guestSeasonSubView.setTitle("Season Pass", for: .normal)
       guestSeasonSubView.addTarget(self, action: #selector(mainButtonGuestAction), for: .touchUpInside)

       let guestSeniorSubView = UIButton()
       guestSeniorSubView.customSubMenuUIButtonProperties()
       guestSeniorSubView.setTitle("Senior", for: .normal)
       guestSeniorSubView.addTarget(self, action: #selector(mainButtonGuestAction), for: .touchUpInside)

       let stackSubView = UIStackView(arrangedSubviews: [guestClassicSubView, guestVipSubView, guestChildSubView, guestSeasonSubView, guestSeniorSubView])
       stackSubView.axis = .horizontal
       stackSubView.distribution = .fillEqually

       view.addSubview(stackSubView)

       stackSubView.translatesAutoresizingMaskIntoConstraints = false
       
       let sectionHeightValue = (self.view.frame.height)/16
       
       NSLayoutConstraint.activate([stackSubView.topAnchor.constraint(equalTo: view.topAnchor, constant: sectionHeightValue * 2), stackSubView.leftAnchor.constraint(equalTo: view.leftAnchor), stackSubView.rightAnchor.constraint(equalTo: view.rightAnchor), stackSubView.heightAnchor.constraint(equalToConstant: sectionHeightValue)])
   }

