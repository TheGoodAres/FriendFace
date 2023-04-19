//
//  ContentView.swift
//  FriendFace
//
//  Created by Robert-Dumitru Oprea on 16/04/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    ForEach(users) { user in
                        NavigationLink {
                            DetailedView(user: user)
                        } label: {
                            HStack {
                                Text(user.wrappedName)
                                Spacer()
                                Image(systemName: "circle.fill")
                                    .foregroundColor(user.isActive ? .green : .gray)
                            }
                        }
                        
                    }
                    .padding()
                }
            }
        }
        .task {
            await loadData()
        }
    }
        

    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                for user in decodedResponse {
                    let cachedUser = CachedUser(context: moc)
                    cachedUser.id = user.id
                    cachedUser.about = user.about
                    cachedUser.address = user.address
                    cachedUser.age = Int16(user.age)
                    cachedUser.company = user.company
                    cachedUser.email = user.email
                    cachedUser.isActive = user.isActive
                    cachedUser.name = user.name
                    cachedUser.registered = user.registered
                    cachedUser.tags = user.tags.joined(separator: ",")
                    for friend in user.friends {
                        let cachedFriend = CachedFriend(context: moc)
                        cachedFriend.id = friend.id
                        cachedFriend.name = friend.name
                        cachedUser.addToFriendRelationship(cachedFriend)
                    }
                }
            }
            if moc.hasChanges {
                try? moc.save()
            }
        } catch {
            print("invalid data")
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
