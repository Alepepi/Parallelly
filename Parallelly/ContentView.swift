//
//  ContentView.swift
//  Parallelly
//
//  Created by Alejandro Ollivier Ochoa on 10/12/24.
//

// SwiftUI implementation of the header UI
import SwiftUI

struct TodayView: View {
    @State private var selectedDate = "MO"

    let days = ["MO", "TU", "WE", "TH", "FR", "SA", "SU"]
    let dates = ["21", "22", "23", "24", "25", "26", "27", "28", "29"]

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Button(action: {
                    // Action for list button
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Spacer()
                Text("Today")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    // Action for settings button
                }) {
                    Image(systemName: "gearshape")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.black)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<days.count, id: \..self) { index in
                        VStack {
                            Text(days[index])
                                .font(.caption)
                                .foregroundColor(.gray)

                            Text(dates[index])
                                .font(.title2)
                                .fontWeight(selectedDate == days[index] ? .bold : .regular)
                                .foregroundColor(selectedDate == days[index] ? .white : .gray)
                                .padding(8)
                                .background(selectedDate == days[index] ? Color.gray.opacity(0.3) : Color.clear)
                                .clipShape(Circle())
                        }
                        .onTapGesture {
                            selectedDate = days[index]
                        }
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.top))
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
