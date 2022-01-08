//
//  IndexView.swift
//  pastDays
//
//  Created by Takashi Inagaki on 2022/01/07.
//

import SwiftUI

struct IndexView: View {
    @AppStorage("birthDate") var birthDate = Date()
    @State var currentDate = Date()
//    @State var birthDate = Date()
    @State var isEdited = false
    
    var closedRange: ClosedRange<Date> {
        let currentDate = Calendar.current.date(byAdding: .day, value: -0, to: Date())!
        let yearsAgo = Calendar.current.date(byAdding: .year, value: -120, to: Date())!
        
        return yearsAgo...currentDate
    }
    


    var body: some View {
        NavigationView {
        VStack {
            Text("Past Days")
            Spacer()
            HStack {
                DatePicker(
                    "Your Birthday",
                     selection: $birthDate,
                     in: closedRange,
                     displayedComponents: [.date]
                )
                .padding()
            }
            if currentDate != birthDate {
                NavigationLink(destination: ContentView()) {
                    Text("Enter")
                }
            }
            else {
                Text("Enter")
            }
            Spacer()
        }
        }
    }

}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
