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

struct CornerRadiusModifier: ViewModifier {
    let radius: CGFloat
    let corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(
                RoundedCornerShape(radius: radius, corners: corners)
            )
    }
}

struct CardAttributedAppDetailModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: 66)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(22)
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

extension View {
    
    func stretchy() -> some View {
        self.modifier(StretchyModifier())
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        modifier(CornerRadiusModifier(radius: radius, corners: corners))
    }
    
    func cardAtributedAppDetail() -> some View {
        modifier(CardAttributedAppDetailModifier())
    }
}

struct InfoTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.medium)
            .lineLimit(2)
    }
}

struct InfoDetailModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.gray)
            .lineLimit(2)
    }
}

struct InfoTitleSection: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .bold()
            .padding(.horizontal, 4)
    }
}

// Text extension
extension Text {
    func infoTitle() -> some View {
        modifier(InfoTitleModifier())
    }
    
    func infoDetail() -> some View {
        modifier(InfoDetailModifier())
    }
    
    func infoTitleSection() -> some View {
        modifier(InfoTitleSection())
    }
    
}
