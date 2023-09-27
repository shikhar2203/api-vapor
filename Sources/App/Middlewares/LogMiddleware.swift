//
//  File.swift
//  
//
//  Created by shikhar on 28/09/23.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware{
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        print("Log Middleware")
        return try await next.respond(to: request)
    }
}
