//
//  UnsplashPhotoUrls.swift
//  UnsplashPhotoService
//
//  Created by Dharini Raghavan on 10/29/23.
//

import Foundation

/// A struct representing a user's public profile from the Unsplash API.
public struct UnsplashUser: Codable {
    public let identifier: String
    public let username: String
    public let firstName: String?
    public let lastName: String?
    public let name: String?
    public let profileImage: UnsplashProfileImage
    public let bio: String?
    public let location: String?
    public let portfolioURL: URL?
    public let totalCollections: Int
    public let totalLikes: Int
    public let totalPhotos: Int

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case username
        case firstName = "first_name"
        case lastName = "last_name"
        case name
        case profileImage = "profile_image"
        case bio
        case location
        case portfolioURL = "portfolio_url"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
    }
}

public struct UnsplashProfileImage: Codable {
    public let small: String
    public let medium: String
    public let large: String
}

