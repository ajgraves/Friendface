//
//  DetailView.swift
//  Friendface
//
//  Created by Aaron Graves on 8/6/24.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        Form {
            /*VStack(alignment: .leading) {
                Text("\(user.name), age \(user.age)")
            */
            Section("User Information") {
                LabeledContent("Name", value: user.name)
                LabeledContent("Age", value: String(user.age))
                LabeledContent("Registered", value: user.registered.formatted())
                LabeledContent("Active", value: user.isActive ? "✅" : "❌")
            }
            
            Section("Additional Information") {
                LabeledContent("Email", value: user.email)
                LabeledContent("Company", value: user.company)
                LabeledContent("Address", value: user.address)
            }
            
            Section("About") {
                Text(user.about)
            }
            
            Section("Tags") {
                ForEach(user.tags, id: \.self) {
                    Text($0)
                }
            }
            
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        /*.frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)*/
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    DetailView(user: User(id: UUID(), isActive: false, name: "Test User", age: 38, company: "Test Company", email: "test@email.com", address: "42 Wallaby Way", about: "Just a test user, that's all", registered: .now, tags: ["Relatable", "Fake"], friends: []))
}
