//
//  LoginViewController.swift
//  UserAccess
//
//  Created by Gustavo Ludtke on 23/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import UIKit

public class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - Variables
    private var presenter: LoginViewPresenting?
    private var email: String?
    private var password: String?
    
    // MARK: - Setup
    private func setup() {
        setupImages()
        setupLabels()
        setupButtons()
        setupTextFields()
    }
    
    private func setupImages() {
        backgroundImageView.image = UserAccess.Asset.gradientBackground.image
        logoImageView.image = UserAccess.Asset.ioasysLogo.image
    }
    
    private func setupLabels() {
        welcomeLabel.text = UserAccess.L10n.welcomeMessage
        welcomeLabel.textColor = UIColor.white
        emailLabel.text = UserAccess.L10n.email
        emailLabel.textColor = UIColor.black
        passwordLabel.text = UserAccess.L10n.password
        passwordLabel.textColor = UIColor.black
    }
    
    private func setupButtons() {
        loginButton.backgroundColor = UIColor.purple
        loginButton.layer.cornerRadius = 8
        loginButton.titleLabel?.text = UserAccess.L10n.enter.uppercased()
        loginButton.titleLabel?.textColor = UIColor.white
    }
    
    private func setupTextFields() {
        emailTextField.addTarget(self, action: #selector(emailDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
    }
    
    // MARK: - Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Actions
    @IBAction private func loginButtonTapped() {
        presenter?.login(email: email ?? "", password: password ?? "")
    }
    
    // MARK: - Functions
    @objc private func emailDidChange() {
        email = emailTextField.text
    }
    
    @objc private func passwordDidChange() {
        password = passwordTextField.text
    }
}
