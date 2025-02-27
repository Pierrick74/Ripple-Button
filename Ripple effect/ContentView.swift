//
//  ContentView.swift
//  Ripple effect
//
//  Created by pierrick viret on 25/02/2025.
//
//
//  ContentView.swift
//  Ripple effect
//
//  Created by pierrick viret on 25/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RippleButton(
            backgroundColor: .blue,
            rippleColor: .white,
            buttonText: "Press me",
            textColor: .white,
            action: { print("Button pressed")
        })
        .frame(width: 200, height: 100)
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
