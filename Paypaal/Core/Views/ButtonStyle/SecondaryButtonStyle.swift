//
//  SecondaryButtonStyle.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    let fontSize: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.custom("Manrope", size: fontSize))
            .foregroundColor(.mainGray)
    }
}
