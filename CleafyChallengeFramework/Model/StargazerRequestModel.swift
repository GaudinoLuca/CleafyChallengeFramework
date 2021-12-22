//
//  StargazerRequestModel.swift
//  CleafyChallengeFramework
//
//  Created by Luca Gaudino on 21/12/21.
//

import Foundation
class StargazerRequestModel: RequestModel {
    
    // MARK: - Properties
    var owner: String
    var repo: String
    
    init(owner: String, repo: String) {
        self.owner = owner
        self.repo = repo
    }
    
    override var path: String {
        return "/repos/\(self.owner)/\(self.repo)/stargazers"
    }
}
