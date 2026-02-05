# 2026-DEV2-036-BerlinClock
# Berlin Clock – iOS SwiftUI

# Berlin Clock – iOS SwiftUI

##-------------------------------------ENGLISH--------------------------------------------

## Description
Implementation of the Berlin Clock in Swift using SwiftUI.  
Displays the time visually with the characteristic Berlin Clock lamps.

## Technologies & Technical Choices
- Swift 5
- SwiftUI
- MVVM architecture
- Unit tests with XCTest
- UI Tests for visual structure
- Timer for automatic time updates

## Project Architecture
- **BerlinClockConverter**: business logic (converts HH:MM:SS → lamp rows)
- **BerlinClockViewModel**: exposes the current time and the Berlin Clock rows
- **ClockView**: main UI
- **LampRowView / LampView**: reusable UI components

## Development Approach (TDD)
1. Implement pure Berlin Clock logic (model)
2. Unit tests to validate each row
3. Build the SwiftUI interface
4. UI tests to verify structure and lamp display
5. Improve readability and accessibility

## Running the Project
1. Open `BerlinClock.xcodeproj`
2. Select an iOS simulator
3. Run (⌘R)

## Possible Improvements
- Animate lamps when the time changes
- Inject time for easier testing and previews
- Dark mode support
- Internationalization (24h/12h format)
- Adaptation to different screen sizes

##-------------------------------------FRANCAIS-------------------------------------------
## Description
Implémentation de l’Horloge de Berlin en Swift avec SwiftUI.  
Affiche l’heure de manière visuelle avec les lampes typiques de l’horloge de Berlin.

## Technologies et choix techniques
- Swift 5
- SwiftUI
- Architecture MVVM
- Tests unitaires avec XCTest
- UI Tests pour la structure visuelle
- Timer pour mise à jour automatique de l’heure

## Architecture du projet
- **BerlinClockConverter** : logique métier (conversion HH:MM:SS → lampes)
- **BerlinClockViewModel** : expose l’heure et les lignes de l’horloge
- **ClockView** : affichage principal
- **LampRowView / LampView** : composants UI réutilisables

## Démarche de développement (TDD)
1. Implémentation de la logique pure Berlin Clock (model)
2. Tests unitaires pour valider chaque ligne
3. Construction de l’UI SwiftUI
4. Tests UI pour vérifier la structure et les lampes
5. Amélioration de la lisibilité et de l’accessibilité

## Lancer le projet
1. Ouvrir `BerlinClock.xcodeproj`
2. Sélectionner un simulateur iOS
3. Run (⌘R)

## Améliorations possibles
- Animation des lampes lors du changement
- Injection de l’heure pour tests et preview
- Support du mode sombre
- Internationalisation (format 24h/12h)
- Adaptation aux différentes tailles d’écran

