import Vapor

func routes(_ app: Application) throws {
    
    app.middleware.use(LogMiddleware())
    try app.register(collection: APIController())
    
    app.get("movies"){ req async in
        [Movie(title: "Batman", year: 2022), Movie(title: "Iron Man", year: 2020), Movie(title: "SpiderMan", year: 2023)]
    }
    
    app.post("movies"){ req async throws in
        guard let movie = try? req.content.decode(Movie.self) else{
            throw Abort(.badRequest)
        }
        return movie
    }
    
    
    app.grouped(AuthenticationMiddleware()).group("members") { route in
        
        route.get(){ req async -> String in
            return "Members"
        }
    }
    
    // Query Strings
    // http://127.0.0.1:8080/hotels?sort=asc&search=houston
    app.get("hotels"){ req async throws in
        let hotelQuery = try req.query.decode(HotelQuery.self)
        return hotelQuery
        
    }
}
