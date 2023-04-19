////
////  UserList.swift
////  FriendFace
////
////  Created by Robert-Dumitru Oprea on 16/04/2023.
////
//
//import SwiftUI
//
//struct UserList: View {
//    var users: [User]
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                RadialGradient(gradient: Gradient(colors: [.orange, .red]), center: .center, startRadius: 100, endRadius: 470)
//                    .ignoresSafeArea()
//                List {
//                    ForEach(users) { user in
//                        NavigationLink(destination: DetailedView(user: user), label: {
//                            HStack {
//                                Text(user.name)
//                                Spacer()
//                                Image(systemName: "circle.fill")
//                                    .foregroundColor(user.isActive ? .green : .gray)
//                            }
//                        })
//                            .listRowBackground(Color.clear)
//                    }
//
//                }
//                    .listStyle(PlainListStyle())
//                    .background {
//                    Color.white
//                        .opacity(0.4)
//                        .cornerRadius(20)
//                }
//                    .padding()
//            }
//
//        }
//    }
//}
