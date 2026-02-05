//
//  ContentView.swift
//  BerlinClock
//
//  Created by Me on 05/02/2026.
//

import SwiftUI

struct ClockView: View {
    @StateObject private var viewModel = BerlinClockViewModel()

    var body: some View {
        VStack(spacing: 14) {

            Text("Berlin Clock")
                .font(.largeTitle)
                .bold()
            
            // Current time
            Text(viewModel.time)
                .font(.title2)
                .padding(.top)
            
            // Berlin Clock rows
            if viewModel.rows.count == 5 { // ✅ sécurité : évite crash si rows pas encore initialisé

            // Secondes (cercle)
            LampRowView(
                row: viewModel.rows[0],
                rowIndex: 0,
                isCircleRow: true,
                lampSize: CGSize(width: 60, height: 60)
            )

            // Heures 5h
            LampRowView(
                row: viewModel.rows[1],
                rowIndex: 1,
                isCircleRow: false,
                lampSize: CGSize(width: 70, height: 30)
            )

            // Heures 1h
            LampRowView(
                row: viewModel.rows[2],
                rowIndex: 2,
                isCircleRow: false,
                lampSize: CGSize(width: 70, height: 30)
            )

            // Minutes 5m (petits rectangles)
            LampRowView(
                row: viewModel.rows[3],
                rowIndex: 3,
                isCircleRow: false,
                lampSize: CGSize(width: 30, height: 30)
            )

            // Minutes 1m
            LampRowView(
                row: viewModel.rows[4],
                rowIndex: 4,
                isCircleRow: false,
                lampSize: CGSize(width: 70, height: 30)
            )
            }


        }
        .padding()
    }
}

#Preview {
    ClockView()
}
