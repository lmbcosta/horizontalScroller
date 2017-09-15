//
//  LibraryAPI.swift
//  RWBlueLibrary
//
//  Created by Luis  Costa on 15/09/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import Foundation

final class LibraryAPI {
  static let shared = LibraryAPI()
  private let persistencyManager = PersistencyManager()
  
  private init() {}
  
  func addAlbum(album: Album, index: Int) {
    self.persistencyManager.addAlbum(album: album, index: index)
  }
  
  func removeAlbum(index: Int) {
    self.persistencyManager.deleteAlbum(at: index)
  }
  
  func getAlbums() -> [Album] {
    return self.persistencyManager.getAlbums()
  }
}
