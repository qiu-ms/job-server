import Vapor
import ReplayKit
import Foundation
import AppKit

func routes(_ app: Application) throws {
    var image: String = ""
    app.on(.POST, "image", body: .collect(maxSize: 1024)) { req async throws -> String in
        let rep = try req.content.decode(rep.self)
        image = rep.image
        return "y"
    }

    app.get("hello") { req async -> String in
        return image
    }
}

struct rep: Content {
    var image: String
}
