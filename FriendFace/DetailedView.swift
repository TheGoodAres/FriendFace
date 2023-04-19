//
//  DetailedView.swift
//  FriendFace
//
//  Created by Robert-Dumitru Oprea on 16/04/2023.
//

import SwiftUI

struct DetailedView: View {
    var user: CachedUser
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(user.wrappedName)
                    Spacer()
                    Text(user.wrappedEmail)
                }
                    .padding()
                VStack {
                    Text("About")
                    Text(user.wrappedAbout)
                        .multilineTextAlignment(.center)
                    Divider()
                    Text("Company: \(user.wrappedCompany)")
                    Divider()
                    Text("Age: \(user.age.description)")
                }
                .padding()
                List{
                    if let friends = user.friendRelationship as? Set<CachedFriend>{
                        Section("friends"){
                            ForEach(Array(friends)) {friend in
                                Text(friend.wrappedName)
                            }
                        }.disabled(true)
                    } else {
                        Text("No friends")
                    }
                }
            }
            
        }
    }
}

//
//struct DetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedView()
//    }
//}
