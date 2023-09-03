//
//  ContentView.swift
//  Friendface
//
//  Created by Mathieu Dubart on 03/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users) { user in
                HStack {
                    NavigationLink {
                        UserView(user: user)
                    } label: {
                        HStack {
                            Circle()
                                .fill(user.isActive ? Color.green : Color.red)
                                .frame(width: 15)
                            
                            Text(user.name)
                        }
                    }
                }
            }
            .navigationTitle("Friendfacer")
            .task {
                await fetchUsers()
            }
        }
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Data loading failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
