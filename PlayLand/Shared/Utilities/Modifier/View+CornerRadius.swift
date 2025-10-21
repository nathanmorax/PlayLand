//
//  View+CornerRadius.swift
//  PlayLand
//
//  Created by Jonathan Mora on 21/10/25.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    var radius: CGFloat = 12
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
