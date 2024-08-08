//
//  ContentView.swift
//  Friendface
//
//  Created by Aaron Graves on 8/6/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    //@State private var users = [User]()
    @Query(sort: [
        SortDescriptor(\User.name)
    ]) var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack {
                        Text(user.isActive ? "✅" : "❌")
                        
                        Text(user.name)
                    }
                    
                }
            }
            .navigationTitle("Friendface")
        }
        .task {
            //users = (try? await loadData()) ?? []
            await loadData()
        }
    }
    
    func loadData() async {
        /*if !users.isEmpty { return } // If we alraeady have the data, then stop
        
        // We need to get data*/
        //let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        //var request = URLRequest(url: url)
        //request.setValue("application/json", forHTTPHeaderField: "Content-type")
        //request.httpMethod = "GET"
        
        /*do {
            //let data = try await URLSession.shared.download(for: request)
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedData: [User] = try decoder.decode([User].self, from: data)
            //return decodedData
            //users = decodedData
            users.insert(decodedData)
            
            // Sort by alphabetical
            // Sort by name, easy
            //users.sort { $0.name < $1.name }
            
        } catch {
            print("Download failed: \(error)")
            return //[]
        }*/
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Invalid URL.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if users.isEmpty {
                guard let decodedResponse = try? decoder.decode([User].self, from: data) else {
                    fatalError("Failed to decode data.")
                }
                try? modelContext.delete(model: User.self)
                for user in decodedResponse {
                    modelContext.insert(user)
                }
            }
        } catch {
            fatalError("Failed to decode data.")
        }
    }
}

#Preview {
    ContentView()
}
