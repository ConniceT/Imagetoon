//
//  Error.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import Foundation

enum CustomError: Error {
    // Throw when an invalid password is entered
    case invalidPassword
    
    // Throw when an expected resource is not found
    case notFound
    
    // Throw in all other cases
    case unexpected(code: Int)
}

extension CustomError {
    var isFatal: Bool {
        if case CustomError.unexpected = self { return true }
        else { return false }
    }
}

extension CustomError: CustomStringConvertible {
    public var description: String {
        switch self {
            case .invalidPassword:
                return "The provided password is not valid."
            case .notFound:
                return "The specified item could not be found."
            case .unexpected(_):
                return "An unexpected error occurred."
        }
    }
}

// For each error type return the appropriate localized description
extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .invalidPassword:
                return NSLocalizedString(
                    "The provided password is not valid.", 
                    comment: "Invalid Password"
                )
            case .notFound:
                return NSLocalizedString(
                    "The specified item could not be found.", 
                    comment: "Resource Not Found"
                )
            case .unexpected(_):
                return NSLocalizedString(
                    "An unexpected error occurred.", 
                    comment: "Unexpected Error"
                )
        }
    }
}

