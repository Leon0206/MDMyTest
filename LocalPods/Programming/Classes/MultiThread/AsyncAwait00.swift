//
//  AsyncAwait00.swift
//  Programming
//
//  Created by lizitao on 2023/2/23.
//

import Foundation

class AsyncAwait00 : CommonOpsProtocol {
    func testCase() {
 
    }
}

class AvatarLoader01 {
    func loadAvatar(token: String) async throws -> UIImage {
    let url = try await fetchAvatarURL(token: token)
    let encryptedData = try await fetchAvatar(url: url)
    let decryptedData = try await decryptAvatar(data: encryptedData)
    return try await decodeImage(data: decryptedData)
    }

    func fetchAvatarURL(token: String) async throws -> String {
        let avatarURL = "  "
        // fetch url from net...
        return avatarURL
    }

    func fetchAvatar(url: String) async throws -> Data {
        let avatarData = Data()
        // download avatar data...
        return avatarData
    }

    func decryptAvatar(data: Data) async throws -> Data {
        let decryptData = Data()
        // decrypt...
        return decryptData
    }

    func decodeImage(data: Data) async throws -> UIImage {
        let avatar = UIImage()
        // decode...
        return avatar
    }
}

class AvatarLoader00 {
    func loadAvatar(token: String, completion: (Result<UIImage, Error>) -> Void) {
    fetchAvatarURL(token: token) { result in
      switch result {
      case let .success(url):
        fetchAvatar(url: url) { result in
          switch result {
          case let .success(decryptData):
            decryptAvatar(data: decryptData) { result in
              switch result {
              case let .success(avaratData):
                decodeImage(data: avaratData) { result in
                  completion(result)
                }

              case let .failure(error):
                completion(.failure(error))
              }
            }
          case let .failure(error):
            completion(.failure(error))
          }
        }
      case let .failure(error):
        completion(.failure(error))
      }
    }
    }

    func fetchAvatarURL(token: String, completion: (Result<String, Error>) -> Void) {
        let avatarURL = ""
        // fetch url from net...
        completion(.success(avatarURL))
    }

    func fetchAvatar(url: String, completion: (Result<Data, Error>) -> Void) {
        let avatarData = Data()
        // download avatar data...
        completion(.success(avatarData))
    }

    func decryptAvatar(data: Data, completion: (Result<Data, Error>) -> Void) {
        let decryptData = Data()
        // decrypt...
        completion(.success(decryptData))
    }

    func decodeImage(data: Data, completion: (Result<UIImage, Error>) -> Void) {
        let avatar = UIImage()
        // decode...
        completion(.success(avatar))
    }
}
 

