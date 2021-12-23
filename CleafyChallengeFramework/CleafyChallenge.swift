//
//  CleafyChallenge.swift
//  CleafyChallengeFramework
//
//  Created by Luca Gaudino on 21/12/21.
//

import Foundation
import UIKit


public struct CleafyChallenge{
    
    public init () {}
    
    public func getStargazer(owner: String, repo:String, completion: @escaping(Swift.Result<[StargazerUser], ErrorModel>) -> Void){
        var error = ""
        if Utility.shared.isJailbroken(application: UIApplication.shared) {
            print ("Il device è Jailbroken\n")
            if error == "" { error = "Errore:\n" }
            error.append("Il device è Jailbroken\n")
        }
        if Utility.shared.isSimulated(){
            print ("Il device è Simulato\n")
            if error == "" { error = "Errore:\n" }
            error.append("Il device è Simulato\n")
        }
        if !Utility.shared.isiOSVersionCompliant(){
            print ("Il device è soddisfa la versione iOS minima\n")
            if error == "" { error = "Errore:\n" }
            error.append("Il device è soddisfa la versione iOS minima\n")
        }
        if Utility.shared.isVPNConnected(){
            print ("Il device è connesso alla VPN\n")
            if error == "" { error = "Errore:\n" }
            error.append("Il device è connesso alla VPN\n")
        }
        if !Utility.shared.isPackageCompiant(){
            print ("Il device è soddisfa il criterio di sicurezza del Package\n")
            if error == "" { error = "Errore:\n" }
            error.append("Il device è soddisfa il criterio di sicurezza del Package\n")
        }
        
        if (Utility.shared.isJailbroken(application: UIApplication.shared) ||
            Utility.shared.isSimulated() ||
            !Utility.shared.isiOSVersionCompliant() ||
            Utility.shared.isVPNConnected() ||
            !Utility.shared.isPackageCompiant()) {
            completion(Result.failure(ErrorModel.specificError(error: error)))
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
