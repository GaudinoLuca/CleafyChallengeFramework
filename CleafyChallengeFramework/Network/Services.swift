//
//  Services.swift
//  CleafyChallengeFramework
//
//  Created by Luca Gaudino on 21/12/21.
//

import Foundation
class Services {
    
    class func getStargazers(_ owner : String, _ repo : String, completion: @escaping(Swift.Result<[StargazerUser], ErrorModel>) -> Void) {
        GitHubServiceManager.shared.sendRequest(request: StargazerRequestModel(owner: owner, repo: repo)) { (result) in
            completion(result)
        }
    }
    
}
