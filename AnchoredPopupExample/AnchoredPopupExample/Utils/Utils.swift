//
//  Utils.swift
//  AnchoredPopupExample
//
//  Created by Alisa Mylnikova on 22.01.2025.
//

import SwiftUI

#if compiler(>=6.0)
extension String: @retroactive Identifiable {
    public var id: String { self }
}
#else
extension String: Identifiable {
    public var id: String { self }
}
#endif

extension View {
    func greedyWidth() -> some View {
        self.frame(maxWidth: .infinity)
    }

    func padding(_ horizontal: CGFloat, _ vertical: CGFloat) -> some View {
        self.padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }

    func size(_ size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }

    func fullTap(action: @escaping () -> Void) -> some View {
        self.contentShape(Rectangle())
            .onTapGesture {
                action()
            }
    }

    @ViewBuilder
    func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }

    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, apply: (Self) -> T) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}

// Extension to easily apply the modifier to any shape
extension Shape {
    func styled(_ foregroundColor: Color, border borderColor: Color = .clear, _ borderWidth: CGFloat = 0) -> some View {
        self.foregroundStyle(foregroundColor)   // Apply foreground color
            .overlay(
                self
                    .stroke(borderColor, lineWidth: borderWidth)  // Apply border color and width
            )
    }
}

class Constants {
    static let sportEmoji = ["🤼‍♂️", "🧘", "🚴", "🏊", "🏄", "🤸", "⛹️", "🏋️", "⚽️"]
}

