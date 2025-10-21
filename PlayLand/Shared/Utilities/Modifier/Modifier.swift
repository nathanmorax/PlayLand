//
//  Modifier.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//

import SwiftUI

struct StretchyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .visualEffect { effect, geometry in
                let currentHeight = geometry.size.height
                let scrollOffset = geometry.frame(in: .scrollView).minY
                let positiveOffset = max(0, scrollOffset)
                
                let newHeight = currentHeight + positiveOffset
                let scaleFactor = newHeight / currentHeight
                
                return effect.scaleEffect(
                    x: scaleFactor, y: scaleFactor,
                    anchor: .bottom
                )
            }
    }
}

extension View {
    func stretchy() -> some View {
        self.modifier(StretchyModifier())
    }
}
