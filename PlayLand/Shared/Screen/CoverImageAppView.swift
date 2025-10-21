//
//  CoverImageAppView.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//

import SwiftUI

enum CoverImageSize: Equatable {
    case small
    case large
    case custom(width: CGFloat, height: CGFloat)
    
    var height: CGFloat {
        switch self {
        case .small: return 80
        case .large: return 170
        case .custom(_, let height): return height
        }
    }
    
    var width: CGFloat? {
        switch self {
        case .small: return 80
        case .large: return nil
        case .custom(let width, _): return width
        }
    }
    
    var shouldCenter: Bool {
        switch self {
        case .custom: return true
        case .small,.large: return false
        }
    }
    
    var hasMaxWidth: Bool {
        switch self {
        case .large: return true
        case .small, .custom: return false
        }
    }
    
    var hasCornerRadius: CGFloat {
        switch self {
        case .large: return 0
        case .small: return 8
        case .custom(width: let width, height: let height):
            return 0
        }
    }
}

struct CoverImageAppView: View {
    
    let coverImageApp: String
    let size: CoverImageSize
    
    init(coverImageApp: String, size: CoverImageSize = .large) {
        self.coverImageApp = coverImageApp
        self.size = size
    }
    
    var body: some View {
        Group {
            AsyncImage(url: URL(string: coverImageApp)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.height)
                    .clipped()
            } placeholder: {
                Color.gray.opacity(0.3)
                    .frame(width: size.width, height: size.height)
            }
        }
        .modifier(SizeModifier(size: size))
    }
}

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct SizeModifier: ViewModifier {
    let size: CoverImageSize
    
    func body(content: Content) -> some View {
        if size.shouldCenter {
            content
                .cornerRadius(size.hasCornerRadius)
                .fixedSize()
                .frame(maxWidth: .infinity)
        } else if size.hasMaxWidth {
            content
                .cornerRadius(size.hasCornerRadius)
                .frame(maxWidth: .infinity)
        } else {
            content
                .cornerRadius(size.hasCornerRadius)
        }
    }
}

