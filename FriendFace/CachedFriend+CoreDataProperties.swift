//
//  CachedFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Robert-Dumitru Oprea on 19/04/2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var friendRelationship: NSSet?

    public var wrappedName: String {
        name ?? "No name"
    }

}

// MARK: Generated accessors for friendRelationship
extension CachedFriend {

    @objc(addFriendRelationshipObject:)
    @NSManaged public func addToFriendRelationship(_ value: CachedUser)

    @objc(removeFriendRelationshipObject:)
    @NSManaged public func removeFromFriendRelationship(_ value: CachedUser)

    @objc(addFriendRelationship:)
    @NSManaged public func addToFriendRelationship(_ values: NSSet)

    @objc(removeFriendRelationship:)
    @NSManaged public func removeFromFriendRelationship(_ values: NSSet)

}

extension CachedFriend: Identifiable {

}
