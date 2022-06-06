//
//  MainButtonStyle.swift
//  Paypaal
//
//  Created by Vincent Grossier on 06/06/2022.
//

import SwiftUI

fileprivate let blueLinearGradient = LinearGradient(
    colors: [.mainBlue, .secondaryBlue],
    startPoint: UnitPoint(x: 0, y: 0),
    endPoint: UnitPoint(x: 1, y: 0)
)


struct MainButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(maxWidth: .infinity, maxHeight: 64)
            .foregroundColor(.white)
            .font(.headline)
            .background(blueLinearGradient)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 40, x: 0, y: 24)
    }
    
}
