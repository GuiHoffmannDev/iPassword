//
//  ViewModifiers.swift
//  iPassword
//
//  Created by Guilher Hoffmann on 23/08/23.
//

import Foundation
import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func addNavigationView(title: String) -> some View {
        NavigationView {
            self.navigationTitle(title)
        }
    }
}
