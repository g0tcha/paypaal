//
//  MainField.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import SwiftUI

struct MainField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: 56)
            .background(.black.opacity(0.05))
            .cornerRadius(20)
    }
}
