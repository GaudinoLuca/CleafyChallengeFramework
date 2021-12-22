//
//  CleafyChallengeFramework.swift
//  CleafyChallengeFramework
//
//  Created by Luca Gaudino on 21/12/21.
//

import Foundation
import UIKit


public struct MyCleafyChallengeFramework{
    
    public init () {}
    
    public func getStargazer(owner: String, repo:String, completion: @escaping(Swift.Result<[StargazerUser], ErrorModel>) -> Void){
//        if (Utility.shared.isJailbroken(application: UIApplication.shared) ||
//            Utility.shared.isSimulated() ||
//            !Utility.shared.isiOSVersionCompliant() ||
//            Utility.shared.isVPNConnected() ||
//            !Utility.shared.isPackageCompiant()) {
//            completion(Result.failure(ErrorModel.generalError()))
//        }
        if Utility.shared.isJailbroken(application: UIApplication.shared) {
            print ("Is Jailbroken")
        }
        if Utility.shared.isSimulated(){
            print ("Is Simulated")
        }
        if !Utility.shared.isiOSVersionCompliant(){
            print ("Is NOT iOS Version Compliant")
        }
        if Utility.shared.isVPNConnected(){
            print ("Is VPN Connected")
        }
        if !Utility.shared.isPackageCompiant(){
            print ("Is NOT Package compliant")
        }
        Services.getStargazers("octocat", "hello-world") { result in
            switch result {
            case Result.success(let response):
                completion(Result.success(response))
                break
            case Result.failure(let error):
                completion(Result.failure(error))
                break
            }
        }
    }
    
}
