//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Robert-Dumitru Oprea on 19/04/2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friendRelationship: NSSet?

    var wrappedAbout: String {
        about ?? "No about"
    }
    var wrappedAddress: String {
        address ?? "No address"
    }
    var wrappedCompany: String {
        company ?? "No company"
    }
    var wrappedEmail: String {
        email ?? "No email"
    }
    var wrappedName: String {
        name ?? "No name"
    }
    var wrappedRegistered: Date {
        registered ?? Date(timeIntervalSince1970: 0)
    }
    var wrappedTags: String {
        tags ?? ""
    }
}

// MARK: Generated accessors for friendRelationship
extension CachedUser {

    @objc(addFriendRelationshipObject:)
    @NSManaged public func addToFriendRelationship(_ value: CachedFriend)

    @objc(removeFriendRelationshipObject:)
    @NSManaged public func removeFromFriendRelationship(_ value: CachedFriend)

    @objc(addFriendRelationship:)
    @NSManaged public func addToFriendRelationship(_ values: NSSet)

    @objc(removeFriendRelationship:)
    @NSManaged public func removeFromFriendRelationship(_ values: NSSet)

}

extension CachedUser: Identifiable {

}
