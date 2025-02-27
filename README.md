# RippleButton
Un composant SwiftUI personnalisé qui implémente un bouton avec un effet de "ripple" (ondulation) élégant, inspiré du Material Design.
## Fonctionnalités
Effet d'ondulation visuel lors du clic
Animation d'ombre pour un feedback tactile visuel
Personnalisation complète (couleurs, texte, action)
Design minimaliste avec coins arrondis

## Capture d'écran

## Installation
Le composant est autonome et ne nécessite aucune dépendance externe. Copiez simplement le fichier RippleButton.swift dans votre projet.
Utilisation basique
```swift
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
```
## Personnalisation
Le composant RippleButton accepte plusieurs paramètres pour une personnalisation complète :
| Paramètre | Type | Description |
|-----------|------|-------------|
| `backgroundColor` | `Color` | Couleur de fond du bouton |
| `rippleColor` | `Color` | Couleur de l'effet d'ondulation |
| `buttonText` | `String` | Texte affiché sur le bouton |
| `textColor` | `Color` | Couleur du texte |
| `action` | `() -> Void` | Fonction exécutée lors du clic |

Vous pouvez également appliquer des modificateurs SwiftUI supplémentaires comme :
- .font
- .foregroundColor
- .frame

## Compatibilité
iOS 17.0+
