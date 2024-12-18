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
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Calendar section
                VStack(spacing: 15) {
                    // Month and year header
                    Text(monthYearString())
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    // Week navigation
                    HStack {
                        Button(action: previousWeek) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Button(action: nextWeek) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
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
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(Color.black)
                
                // Content area for the rest of your app
                ScrollView {
                    // Add your content here
                    VStack {
                        // This is a placeholder for your content
                        ForEach(0..<10) { _ in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 100)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        }
                    }
                }
                .background(Color.black)
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
