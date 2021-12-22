//
//  Utility.swift
//  CleafyChallengeFramework
//
//  Created by Luca Gaudino on 21/12/21.
//

import Foundation
import UIKit

struct Utility {
    
    static let shared: Utility = Utility()
    
    public func isVPNConnected() -> Bool {
        let vpnProtocolsKeysIdentifiers = ["tap", "tun", "ppp", "ipsec", "utun"]
        let cfDict = CFNetworkCopySystemProxySettings()
        let nsDict = cfDict!.takeRetainedValue() as NSDictionary
        guard let keys = nsDict["__SCOPED__"] as? NSDictionary else {
            return false
        }

        for key: String in keys.allKeys as! [String] {
            for protocolId in vpnProtocolsKeysIdentifiers
                where key.starts(with: protocolId) {
                return true
            }
        }
        return false
    }
    
    public func isSimulated() -> Bool{
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
    
    public func isiOSVersionCompliant () -> Bool{
        if #available(iOS 13, *) {
            return true
        } else {
            return false
        }
    }
    
    public func isPackageCompiant() -> Bool{
        let bundleIdentifier = Bundle.main.bundleIdentifier
        if (bundleIdentifier?.count ?? 20 < 20){
            return true
        } else {
            return false
        }
    }
    
    public func isJailbroken(application: UIApplication) -> Bool {
        guard let cydiaUrlScheme = NSURL(string: "cydia://package/com.example.package") else { return checkJailbroken() }
        return application.canOpenURL(cydiaUrlScheme as URL) || checkJailbroken()
    }
}

//private functions
extension Utility {
    private func checkJailbroken() -> Bool {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: "/Applications/Cydia.app") ||
            fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
            fileManager.fileExists(atPath: "/bin/bash") ||
            fileManager.fileExists(atPath: "/usr/sbin/sshd") ||
            fileManager.fileExists(atPath: "/etc/apt") ||
            fileManager.fileExists(atPath: "/usr/bin/ssh") {
            return true
        }
        if canOpen(path: "/Applications/Cydia.app") ||
            canOpen(path: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
            canOpen(path: "/bin/bash") ||
            canOpen(path: "/usr/sbin/sshd") ||
            canOpen(path: "/etc/apt") ||
            canOpen(path: "/usr/bin/ssh") {
            return true
        }
        let path = "/private/" + NSUUID().uuidString
        do {
            try "anyString".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            try fileManager.removeItem(atPath: path)
            return true
        } catch {
            return false
        }
    }
    private func canOpen(path: String) -> Bool {
        let file = fopen(path, "r")
        guard file != nil else { return false }
        fclose(file)
        return true
    }
}
