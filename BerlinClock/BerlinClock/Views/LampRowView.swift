//
//  LampRowView.swift
//  BerlinClock
//
//  Created by Me on 05/02/2026.
//


import SwiftUI

struct LampRowView: View {

     let row: String
     let rowIndex: Int
     let isCircleRow: Bool
     let lampSize: CGSize

     var body: some View {
         HStack(spacing: 6) {
             let lamps = Array(row)
             ForEach(lamps.indices, id: \.self) { index in
                 LampView(
                     lamp: Array(row)[index],
                     isCircle: isCircleRow,
                     width: lampSize.width,
                     height: lampSize.height,
                     identifier: "lamp_\(rowIndex)_\(index)"
                 )
             }
         }
         .accessibilityIdentifier("lampRow_\(rowIndex)")
     }
    
}

