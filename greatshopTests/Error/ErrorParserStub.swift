//
//  ErrorParserStub.swift
//  greatshopTests
//
//  Created by soaltomas on 01.04.2018.
//  Copyright © 2018 soaltomas. All rights reserved.
//

import Foundation
@testable import greatshop

enum ErrorParserStub: Error {
    case fatalError
}

struct ErrorParserMock: AbstractErrorParser {
    var isSuccess = true
    
    func parse(result: Error) -> Error {
        if isSuccess {
            return result
        } else {
            return ErrorParserStub.fatalError
        }
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        if isSuccess {
            return nil
        } else {
            return ErrorParserStub.fatalError
        }
    }
}
