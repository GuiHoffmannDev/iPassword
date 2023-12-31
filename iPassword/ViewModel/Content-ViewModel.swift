//
//  Content-ViewModel.swift
//  iPassword
//
//  Created by Guilher Hoffmann on 23/08/23.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var passwords: [Password] = []
        @Published var containsSymbols = true
        @Published var containsUppercase = false
        @Published var lenght = 10
        
        init() {
            createPassword()
        }
        
        func createPassword() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "1234567890"
            var newPassword = ""
            
            if containsSymbols {
                base += "!@#$%&*()/,?;:-+="
            }
            if containsUppercase {
                base += alphabet.uppercased()
            }
            
            for _ in 0..<lenght {
                let randChar = base.randomElement()!
                newPassword += String(randChar)
            }
            
            let password = Password(password: newPassword, containsSymbols: containsSymbols, containsUppercase: containsUppercase)
            
            withAnimation {
                passwords.insert(password, at: 0)
            }
        }
    }
}
