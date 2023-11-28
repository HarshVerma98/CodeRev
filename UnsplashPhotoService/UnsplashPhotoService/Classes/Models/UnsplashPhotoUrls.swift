//
//  UnsplashPhotoUrls.swift
//  UnsplashPhotoService
//
//  Created by Dharini Raghavan on 10/29/23.
//

import Foundation

public struct UnsplashPhotoUrls: Codable {
    public let raw: String
    public let full: String
    public let regular: String
    public let small: String
    public let thumb: String
}
