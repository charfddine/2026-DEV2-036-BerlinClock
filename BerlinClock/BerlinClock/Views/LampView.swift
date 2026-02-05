//
//  LampView.swift
//  BerlinClock
//
//  Created by Me on 05/02/2026.
//

import SwiftUI

struct LampView: View {

    let lamp: Character
    let isCircle: Bool
    let width: CGFloat
    let height: CGFloat
    let identifier: String

    var body: some View {
        Group {
            if isCircle {
                Circle()
                    .fill(color)
            } else {
                RoundedRectangle(cornerRadius: 6)
                    .fill(color)
            }
        }
        .frame(width: width, height: height)
        .overlay(
            RoundedRectangle(cornerRadius: isCircle ? height / 2 : 6)
                .stroke(Color.gray, lineWidth: 2)
        )
        .accessibilityElement()
        .accessibilityIdentifier(identifier)
        .accessibilityValue(colorName)
    }
    
    /// Returns the color of the lamp based on the character:
    private var color: Color {
        switch lamp {
        case "R": return .red
        case "Y": return .yellow
        default: return .white
        }
    }

    /// "R" -> red, "Y" -> yellow, "O"/other -> off (white)
    private var colorName: String {
        switch lamp {
        case "R": return "red"
        case "Y": return "yellow"
        default: return "off"
        }
    }
}
