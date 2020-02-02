//
//  UIExtensions.swift
//  AmusementParkPassGeneratorC
//
//  Created by Phil Cachia on 12/20/19.
//  Copyright © 2019 Phil Cachia. All rights reserved.
//
// extensions for viewcontroller objects

import UIKit

extension UIButton {
    func customMainMenuUIButtonProperties() {
        self.titleLabel?.font =  UIFont(name: "Arial", size: 22.0)
        self.backgroundColor = .systemIndigo
        self.setTitleColor(.white, for: .normal)
    }
    func customSubMenuUIButtonProperties() {
        self.titleLabel?.font =  UIFont(name: "Arial", size: 22.0)
        self.backgroundColor = .gray
        self.setTitleColor(.white, for: .normal)
    }
    func customSubmitUIButtonProperties() {
        self.titleLabel?.font =  UIFont(name: "Arial", size: 22.0)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(.white, for: .normal)
    }
    func customTestUIButtonProperties() {
        self.titleLabel?.font =  UIFont(name: "Arial", size: 14.0)
        self.backgroundColor = .white
        self.setTitleColor(.systemTeal, for: .normal)
    }
}

extension UILabel {
    func customUILabelProperties() {
        self.font = UIFont(name:"Arial", size: 22.0)
        self.textAlignment = .left
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UITextField {
    func UITextFieldDisabled() {
        self.backgroundColor = .lightGray
        self.isEnabled = false
        self.text = ""
    }
    func UITextFieldEnabled() {
        self.backgroundColor = .white
        self.isEnabled = true
    }
    func customUITextFieldProperties() {
        self.borderStyle = .roundedRect
        self.translatesAutoresizingMaskIntoConstraints = false
        self.UITextFieldDisabled()
        self.layer.borderWidth = 2.0;
    }
}

extension UIStackView {
    func customUIStackViewProperties() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = UIStackView.spacingUseSystem
    }
}
