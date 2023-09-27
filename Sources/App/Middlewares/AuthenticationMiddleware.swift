//
//  File.swift
//  
//
//  Created by shikhar on 28/09/23.
//

import Foundation
import Vapor

struct AuthenticationMiddleware: AsyncMiddleware{
    
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        
        // Headers: Authorization: BearerAuthorization
        
        guard let authorization = request.headers.bearerAuthorization else {
            throw Abort(.unauthorized)
        }
        print(authorization.token)
        return try await next.respond(to: request)
    }
}
