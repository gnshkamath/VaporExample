import Vapor

let drop = Droplet()

drop.get("/") { request in
    return "Welcome to Vapor!"
}

drop.get("/name", ":name") { request in
    if let name = request.parameters["name"]?.string {
        return "Hello \(name)!"
    }
    
    return "Error fetching params!"
}

drop.get("/view") { request in
    return try drop.view.make("view.html")
}

drop.run()
