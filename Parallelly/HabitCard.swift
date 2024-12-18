//
//  HabitCard.swift
//  Parallelly
//
//  Created by Alejandro Ollivier Ochoa on 18/12/24.
//


import SwiftUI

struct HabitCard: View {
    let icon: String
    let title: String
    let progress: Double
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            // Left section with icon and title
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Right section with progress
            VStack(alignment: .trailing) {
                Text(String(format: "%.0f", progress))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("\(Int(progress * 100))%")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

// End of file. No additional code.
