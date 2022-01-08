//
//  ContentView.swift
//  pastDays
//
//  Created by Takashi Inagaki on 2022/01/07.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("birthDate") var birthDate = Date()
    @State var pastDate = Date()
    @State var pastDateString = "XXXX/XX/XX"
    @State var age = -1
    var dateFormat = "YYYY/MM/dd"
    
    func updateAge(fromDate: Date, endDate: Date) {
        let calendar = Calendar.current
        let year1 = calendar.dateComponents([.year], from: birthDate).year ?? 0
        let year2 = calendar.dateComponents([.year], from: pastDate).year ?? 0
        age =  year2 - year1
    }
    
    func updateDate(currentDate: Date) {
        pastDate = Date.randomBetween(start: birthDate, end: currentDate)
        pastDateString = pastDate.dateString(dateFormat)
    }
    
    func updateAll() {
        let currentDate = Date()
        updateDate(currentDate: currentDate)
        updateAge(fromDate: birthDate, endDate: pastDate)
    }
    
    var body: some View {
        VStack {
            Text("Past Days")
                .padding()
                .font(.largeTitle)
            Spacer()
            Text(pastDateString)
                .padding()
                .font(.largeTitle)

            
            if age >= 0 {
                Text("Pop up old photos? news?")
                Spacer()
                Text("You were \(age) old.")
            }
            
            Button(action: updateAll) {
                Text("Remember")
            }
            .padding()
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
