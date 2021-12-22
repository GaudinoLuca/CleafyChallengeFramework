//
//  GitHubServiceManager.swift
//  CleafyChallengeFramework
//
//  Created by Luca Gaudino on 21/12/21.
//

import Foundation
class GitHubServiceManager {
    
    // MARK: - Properties
    static let shared: GitHubServiceManager = GitHubServiceManager()
    
    var baseURL: String = "https://api.github.com"
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Swift.Result<[T], ErrorModel>) -> Void) {
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            guard let data = data, let parsedResponse = try? JSONDecoder().decode([T].self, from: data) else {
                let error: ErrorModel = ErrorModel(ErrorKey.parsing.rawValue)
                completion(Result.failure(error))
                return
            }
            var responseModel: ResponseModel<[T]> = .init()
            responseModel.isSuccess = true
            responseModel.data = parsedResponse
            responseModel.rawData = data
            responseModel.request = request
            if responseModel.isSuccess, let data = responseModel.data {
                completion(Result.success(data))
            } else {
                completion(Result.failure(ErrorModel.generalError()))
            }
        }.resume()
    }
}
