//
//  ContentView.swift
//  Parallelly
//
//  Created by Alejandro Ollivier Ochoa on 10/12/24.
//

import SwiftUI

struct CalendarView: View {
    // Add these properties
    @State private var currentWeek: Date = Date()
    private let calendar = Calendar.current
    private let weekDays = ["SU", "MO", "TU", "WE", "TH", "FR", "SA"]
    
    // Add this property
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    // Calendar section
                    VStack(spacing: 15) {
                        // Month and year header
                        Text(monthYearString())
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .accessibilityAddTraits(.isHeader)
                        
                        // Week navigation
                        HStack {
                            Button(action: previousWeek) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                            }
                            .accessibilityLabel("Previous week")
                            .accessibilityHint("Navigate to the previous week")
                            
                            Spacer()
                            
                            Button(action: nextWeek) {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                            }
                            .accessibilityLabel("Next week")
                            .accessibilityHint("Navigate to the next week")
                        }
                        .padding(.horizontal)
                        
                        // Days grid
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 15) {
                            ForEach(0..<7) { index in
                                let date = getWeekDates()[index]
                                VStack(spacing: 8) {
                                    Text(weekDays[index])
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    
                                    Text(String(calendar.component(.day, from: date)))
                                        .font(.system(size: 16))
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .frame(width: 35, height: 35)
                                        .background(isToday(date) ? Color.blue : Color.clear)
                                        .clipShape(Circle())
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityLabel(getAccessibilityDateLabel(date))
                                .accessibilityAddTraits(isToday(date) ? [.isSelected] : [])
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.black)
                    
                    // Content area for the rest of your app
                    ScrollView {
                        VStack(spacing: 15) {
                            HabitCard(icon: "figure.walk",
                                    title: "Walk",
                                    progress: 5860,
                                    color: Color.orange)
                                .accessibilityLabel("Walk progress")
                                .accessibilityValue("5,860 steps, 65% complete")
                            
                            // Add more habit cards here
                            HabitCard(icon: "bed.double",
                                    title: "Sleep",
                                    progress: 7.5,
                                    color: Color.blue)
                                .accessibilityLabel("Sleep progress")
                                .accessibilityValue("7.5 hours, 75% complete")
                            
                            HabitCard(icon: "drop",
                                    title: "Water",
                                    progress: 2.1,
                                    color: Color.cyan)
                                .accessibilityLabel("Water intake progress")
                                .accessibilityValue("2.1 liters, 70% complete")
                        }
                        .padding()
                    }
                    .background(Color.black)
                    
                    // Add custom tab bar at the bottom
                    CustomTabBar(selectedTab: $selectedTab)
                }
                
                // Floating add button's shadow effect
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 56, height: 56)
                    .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - 80)
                    .blur(radius: 20)
            }
            .navigationBarHidden(true)
        }
    }
    
    // Add these helper functions
    private func getWeekDates() -> [Date] {
        let calendar = Calendar.current
        let weekInterval = calendar.dateInterval(of: .weekOfYear, for: currentWeek)!
        return (0...6).map { day in
            calendar.date(byAdding: .day, value: day, to: weekInterval.start)!
        }
    }
    
    private func monthYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentWeek)
    }
    
    private func isToday(_ date: Date) -> Bool {
        calendar.isDate(date, inSameDayAs: Date())
    }
    
    private func getAccessibilityDateLabel(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let dateString = formatter.string(from: date)
        return isToday(date) ? "Today, \(dateString)" : dateString
    }
    
    private func previousWeek() {
        if let newDate = calendar.date(byAdding: .weekOfYear, value: -1, to: currentWeek) {
            currentWeek = newDate
        }
    }
    
    private func nextWeek() {
        if let newDate = calendar.date(byAdding: .weekOfYear, value: 1, to: currentWeek) {
            currentWeek = newDate
        }
    }
}

struct WeekCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
