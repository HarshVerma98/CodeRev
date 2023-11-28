//
//  TopicModel.swift
//  Example
//
//  Created by Harsh Verma on 11/11/23.
//  Copyright © 2023 Unsplash. All rights reserved.
//

import Foundation

// MARK: - Data Model

struct ImageDataModel: Codable {
    let id: String?
    let slug: String?
    let title: String?
    let description: String?
    let publishedAt: String?
    let updatedAt: String?
    let startsAt: String?
    let endsAt: String?
    let onlySubmissionsAfter: String?
    let visibility: String?
    let featured: Bool?
    let totalPhotos: Int?
    let links: TopicLinks?
    let status: String?
    let owners: [TopicOwner]?
    let topContributors: [TopicOwner]?
    let coverPhoto: TopicCoverPhoto?
    let urls: TopicPhotoURLs?

    enum CodingKeys: String, CodingKey {
        case id, slug, title, description, urls
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
        case startsAt = "starts_at"
        case endsAt = "ends_at"
        case onlySubmissionsAfter = "only_submissions_after"
        case visibility, featured, totalPhotos, links, status, owners
        case topContributors = "top_contributors"
        case coverPhoto = "cover_photo"
    }
}

struct TopicLinks: Codable {
    let `self`: String?
    let html: String?
    let photos: String?
}

struct TopicOwner: Codable {
    let id: String?
    let updatedAt: String?
    let username: String?
    let name: String?
    let firstName: String?
    let lastName: String?
    let twitterUsername: String?
    let portfolioURL: String?
    let bio: String?
    let location: String?
    let links: TopicOwnerLinks?
    let profileImage: TopicProfileImage?
    let instagramUsername: String?
    let totalCollections: Int?
    let totalLikes: Int?
    let totalPhotos: Int?
    let acceptedTos: Bool?

    enum CodingKeys: String, CodingKey {
        case id, updatedAt, username, name, firstName, lastName
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links, profileImage
        case instagramUsername = "instagram_username"
        case totalCollections, totalLikes, totalPhotos, acceptedTos
    }
}

struct TopicOwnerLinks: Codable {
    let `self`: String?
    let html: String?
    let photos: String?
    let likes: String?
    let portfolio: String?
    let following: String?
    let followers: String?
}

struct TopicProfileImage: Codable {
    let small: String?
    let medium: String?
    let large: String?
}

struct TopicCoverPhoto: Codable {
    let id: String?
    let createdAt: String?
    let updatedAt: String?
    let promotedAt: String?
    let width: Int?
    let height: Int?
    let color: String?
    let blurHash: String?
    let description: String?
    let altDescription: String?
    let urls: TopicPhotoURLs?
    let links: TopicPhotoLinks?
    let user: TopicOwner?
}

struct TopicPhotoURLs: Codable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
}

struct TopicPhotoLinks: Codable {
    let `self`: String?
    let html: String?
    let download: String?
    let downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case `self`, html, download
        case downloadLocation = "download_location"
    }
}

//struct TopicPreviewPhoto: Codable {
//    let id: String?
//    let createdAt: String?
//    let updatedAt: String?
//    let urls: TopicPhotoURLs?
//}
