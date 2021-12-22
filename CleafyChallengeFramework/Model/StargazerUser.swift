//
//  StargazerUser.swift
//  CleafyChallengeFramework
//
//  Created by Luca Gaudino on 21/12/21.
//

import Foundation
public struct StargazerUser: Codable {
    
    // MARK: - Properties
    var login: String?
    var id: Int?
    var node_id: String?
    var avatar_url: String?
    var gravatar_id: String?
    var url: String?
    var html_url: String?
    var followers_url: String?
    var following_url: String?
    var gists_url: String?
    var starred_url: String?
    var subscriptions_url: String?
    var organizations_url: String?
    var repos_url: String?
    var events_url: String?
    var received_events_url: String?
    var type: String?
    var site_admin: Bool
    
    //    "login": "octocat",
    //    "id": 1,
    //    "node_id": "MDQ6VXNlcjE=",
    //    "avatar_url": "https://github.com/images/error/octocat_happy.gif",
    //    "gravatar_id": "",
    //    "url": "https://api.github.com/users/octocat",
    //    "html_url": "https://github.com/octocat",
    //    "followers_url": "https://api.github.com/users/octocat/followers",
    //    "following_url": "https://api.github.com/users/octocat/following{/other_user}",
    //    "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
    //    "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
    //    "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
    //    "organizations_url": "https://api.github.com/users/octocat/orgs",
    //    "repos_url": "https://api.github.com/users/octocat/repos",
    //    "events_url": "https://api.github.com/users/octocat/events{/privacy}",
    //    "received_events_url": "https://api.github.com/users/octocat/received_events",
    //    "type": "User",
    //    "site_admin": false
}
