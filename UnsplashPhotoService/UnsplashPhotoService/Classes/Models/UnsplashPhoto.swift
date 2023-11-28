//
//  UnsplashPhotoUrls.swift
//  UnsplashPhotoService
//
//  Created by Dharini Raghavan on 10/29/23.
//

import UIKit

/// A struct representing a photo from the Unsplash API.
public struct UnsplashPhoto: Codable {
    public let id: String
    public let createdAt: String
    public let updatedAt: String
    public let width: Int
    public let height: Int
    public let color: String
    public let blurHash: String
    public let likes: Int
    public let likedByUser: Bool
    public let description: String?
    public let user: UnsplashUser
    public let urls: UnsplashPhotoUrls

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width
        case height
        case color
        case blurHash = "blur_hash"
        case likes
        case likedByUser = "liked_by_user"
        case description
        case user
        case urls
    }
}


