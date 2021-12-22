//
//  ErrorModel.swift
//  CleafyChallengeFramework
//
//  Created by Luca Gaudino on 21/12/21.
//

import Foundation
public class ErrorModel: Error {
    
    // MARK: - Properties
    var messageKey: String
    
    init(_ messageKey: String) {
        self.messageKey = messageKey
    }
    
    class func generalError() -> ErrorModel {
        return ErrorModel(ErrorKey.general.rawValue)
    }
}
