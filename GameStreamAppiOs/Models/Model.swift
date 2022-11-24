//
//  Model.swift
//  GameStreamAppiOs
//
//  Created by Pierre Juarez U. on 23/11/22.
//

import Foundation

struct Games: Codable {
  
  let games:[Game]
  
}

struct Game: Codable {
  let title, studio, contentRaiting, publicationYear, description : String,
      platforms, tags, galleryImages : [String],
      videosUrls: videoUrl
  
}

struct videoUrl: Codable {
  let mobile, tablet : String
}
