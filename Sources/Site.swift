import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        var site = ZegelinFamilySite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}


struct ZegelinFamilySite: Site {
    var name = "Zegelin Family Website"
    var titleSuffix = ""
    var url = URL(static: "https://www.zegelin.com")
    var builtInIconsEnabled = true

    var author = "Peter Zegelin"

    var homePage = Home()
    var layout = HomePage()
    
    var lightTheme: (any Theme)? = nil
    
    var staticPages: [any StaticPage] {
        FamilyTree()
        Pictures()
        Contact()
        ZegelinRoad()
    }
}
