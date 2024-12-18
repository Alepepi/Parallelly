//
//  CustomTabBar.swift
//  Parallelly
//
//  Created by Alejandro Ollivier Ochoa on 18/12/24.
//


import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            // Today Tab
            TabBarButton(imageName: "square.fill",
                         title: "Today",
                         isSelected: selectedTab == 0)
                .onTapGesture { selectedTab = 0 }
            
            Spacer()
            
            // Challenges Tab
            TabBarButton(imageName: "triangle.fill",
                         title: "Challenges",
                         isSelected: selectedTab == 1)
                .onTapGesture { selectedTab = 1 }
            
            Spacer()
            
            // Add Button
            Button(action: { }) {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 56, height: 56)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.white)
                    )
            }
            .offset(y: -20)
            
            Spacer()
            
            // Stats Tab
            TabBarButton(imageName: "chart.bar.fill",
                         title: "Stats",
                         isSelected: selectedTab == 2)
                .onTapGesture { selectedTab = 2 }
            
            Spacer()
            
            // Explore Tab
            TabBarButton(imageName: "book.fill",
                         title: "Explore",
                         isSelected: selectedTab == 3)
                .onTapGesture { selectedTab = 3 }
            
            Spacer()
        }
        .padding(.top, 8)
        .frame(height: 60)
        .background(Color.black.edgesIgnoringSafeArea(.bottom))
    }
}

struct TabBarButton: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: imageName)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? .blue : .gray)
            
            Text(title)
                .font(.caption2)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}

// End of file. No additional code.