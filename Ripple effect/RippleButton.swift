//
//  RippleButton.swift
//  Ripple effect
//
//  Created by pierrick viret on 27/02/2025.
//

import SwiftUI

/**
 * Structure representing a custom button with a ripple effect.
 *
 * - Parameters:
 *   - backgroundColor: The background color of the button.
 *   - rippleColor: The color of the ripple effect.
 *   - buttonText: The text displayed on the button.
 *   - textColor: The color of the button text.
 *   - action: The action to perform when the button is tapped.
 */
struct RippleButton: View {
    @State private var shadowOffset: CGFloat = 5
    @State private var rippleCircles: [RippleCircle] = []

    // Configuration for the button
    let backgroundColor: Color
    let rippleColor: Color
    let buttonText: String
    let textColor: Color
    let action: () -> Void

    var body: some View {
        ZStack {
            backgroundColor

            Text(buttonText)

            Color.clear
                .contentShape(Rectangle())
                .onTapGesture { location in
                    createRipple(at: location)
                    action()
                    withAnimation {
                        shadowOffset = 0
                    }
                }

            ForEach(rippleCircles) { circle in
                Circle()
                    .fill(rippleColor.opacity(0.3))
                    .frame(width: circle.size, height: circle.size)
                    .position(circle.position)
            }
        }
        .onChange(of: rippleCircles) {
            if rippleCircles.isEmpty {
                withAnimation {
                    shadowOffset = 5
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 0, x: shadowOffset, y: shadowOffset)
    }

    /**
     * Creates a ripple effect circle at a specified position.
     *
     * - Parameters:
     *   - position: The position where the ripple effect starts.
     */
    private func createRipple(at position: CGPoint) {
        let id = UUID()
        let newCircle = RippleCircle(id: id, position: position, size: 0)
        rippleCircles.append(newCircle)

        withAnimation(.easeOut(duration: 0.48)) {
            if let index = rippleCircles.firstIndex(where: { $0.id == id }) {
                rippleCircles[index].size = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
            rippleCircles.removeAll()
        }
    }

    /**
     * Data structure representing a ripple circle with a unique identifier, position, and size.
     */
    struct RippleCircle: Identifiable, Equatable {
        let id: UUID
        let position: CGPoint
        var size: CGFloat
    }
}
