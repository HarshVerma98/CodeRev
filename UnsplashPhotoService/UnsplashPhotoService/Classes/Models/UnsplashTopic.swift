//
//  UnsplashTopic.swift
//  UnsplashPhotoService
//
//  Created by Dharini Raghavan on 10/28/23.
//

import Foundation

/// A struct representing a topic from the Unsplash API.
public struct UnsplashTopic: Codable {

    public let id: String
    public let slug: String
    public let title: String
    public let description: String
    public let publishedAt: String
    public let updatedAt: String
    public let startsAt: String?
    public let endsAt: String?
    public let onlySubmissionsAfter: String?
    public let visibility: String
    public let featured: Bool
    public let totalPhotos: Int
    public let status: String
    public let owners: [UnsplashUser]
    public let coverPhoto: UnsplashPhoto
    public let previewPhotos: [UnsplashPreviewPhoto]
    
    private enum CodingKeys: String, CodingKey {
        case id, slug, title, description
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case startsAt = "starts_at"
        case endsAt = "ends_at"
        case onlySubmissionsAfter = "only_submissions_after"
        case visibility, featured
        case totalPhotos = "total_photos"
        case status, owners
        case coverPhoto = "cover_photo"
        case previewPhotos = "preview_photos"
    }
}

public struct UnsplashPreviewPhoto: Codable {
    public let id: String
    public let createdAt: String
    public let updatedAt: String
    public let urls: UnsplashPhotoUrls
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case urls
    }
}



