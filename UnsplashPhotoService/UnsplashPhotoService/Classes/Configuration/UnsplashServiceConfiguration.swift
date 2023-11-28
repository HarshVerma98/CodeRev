//
//  UnsplashPhotoPickerConfiguration.swift
//  UnsplashPhotoPicker
//
//  Created by Bichon, Nicolas on 2018-10-09.
//  Copyright © 2018 Unsplash. All rights reserved.
//

import Foundation

/**
 Content Safety

 By default, endpoints set the `content_filter` to `low`, which guarantees that no content violating our
 submission guidelines (like images containing nudity or violence) will be returned in results.

 To give you flexibility in filtering content further, set the `content_filter` to `high` (on endpoints that
 support it) to further remove content that may be unsuitable for younger audiences. Note that we can’t
 guarantee that all potentially unsuitable content is removed.
 */
public enum ContentFilterLevel: String {
    case low
    case high
}

/// Encapsulates configuration information for the behavior of UnsplashPhotoPicker.
public struct UnsplashServiceConfiguration {

    /// Your application’s access key.
    public var accessKey = ""

    /// Your application’s secret key.
    public var secretKey = ""

    /// Set the content safety filter.
    public var contentFilterLevel = defaultContentFilterLevel

    /// The default content safety filter.
    public static let defaultContentFilterLevel: ContentFilterLevel = .low

    /// The Unsplash API url.
    let apiURL = "https://api.unsplash.com/"

    /**
     Initializes an `UnsplashPhotoPickerConfiguration` object with optionally customizable behaviors.

     - parameter accessKey:               Your application’s access key.
     - parameter secretKey:               Your application’s secret key.
     - parameter memoryCapacity:          The memory capacity used by the cache.
     - parameter diskCapacity:            The disk capacity used by the cache.
     */
    public init(accessKey: String,
                secretKey: String,
                contentFilterLevel: ContentFilterLevel = defaultContentFilterLevel
    ) {
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.contentFilterLevel = contentFilterLevel
    }

    init() {}

}
