/*
 
 NASIR MAHMOOD
 
 Comment:
 LoginViewController Extension
 Handles all the work related to validation
 
 */

import Foundation
import Validator

//MARK: Validators Extension
extension LoginViewController
{
    
    func setValidators() {
        //Boiler plate code for validator setting, suppors multiple validator rules
        emailTextField.validateOnInputChange(enabled: true)
        emailTextField.validationHandler = { result in self.updateEmailValidationState(result: result) }
        emailvalidationRuleSet = ValidationRuleSet<String>()
        let emailPattern = EmailValidationPattern.simple
        let emailRule = ValidationRulePattern(pattern: emailPattern, error: ValidationError(message: ErrorMessage.invalidEmail ))
        emailvalidationRuleSet?.add(rule: emailRule)
        emailTextField.validationRules = emailvalidationRuleSet
        
        passwordTextField.validateOnInputChange(enabled: true)
        passwordTextField.validationHandler = { result in self.updatePasswordValidationState(result: result) }
        passwordvalidationRuleSet = ValidationRuleSet<String>()
        let minLengthRule = ValidationRuleLength(min: 6, error: ValidationError(message: ErrorMessage.invalidEmailLength))
        passwordvalidationRuleSet?.add(rule: minLengthRule)
        passwordTextField.validationRules = passwordvalidationRuleSet
    }
    
    //MARK: Validators
    func updateEmailValidationState(result: ValidationResult) {
        switch result {
        case .valid:
            emailStateLabel.text = " ✔"
        case .invalid(let failures):
            let messages = failures.flatMap { $0 as? ValidationError }.map { $0.message }
            emailStateLabel.text = messages.joined(separator: "")
        }
    }
    
    func updatePasswordValidationState(result: ValidationResult) {
        switch result {
        case .valid:
            passwordStateLabel.text = " ✔"
        case .invalid(let failures):
            let messages = failures.flatMap { $0 as? ValidationError }.map { $0.message }
            passwordStateLabel.text = messages.joined(separator: "")
        }
    }
    
    func updateValidationStatusForButton() -> Bool {
        return emailTextField.validate(rules: emailvalidationRuleSet!).isValid && passwordTextField.validate(rules: passwordvalidationRuleSet!).isValid
    }
    
    
}

