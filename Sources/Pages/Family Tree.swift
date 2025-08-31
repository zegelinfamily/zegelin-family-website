import Foundation
import Ignite


struct FamilyTree: StaticPage {
    @Environment(\.decode) var decode
    var title = "Family Tree"
    
    var body: some HTML {
        let page = decode.data(forResource:"family-tree.md")!
        let str = String(decoding: page, as: UTF8.self)
        
        Heading(title: title)
        
        Text(markdown: str)
            .margin(.top, 40)
        Text("Open the image in a new tab or window for a better view")
            .horizontalAlignment(.center)
            .font(.title4)
        Image("/familytree/zegelin-tree.png", description: "Zegelin Family Tree")
            .resizable()
    }
}


struct Heading: HTML{
    var title: String
    
    var body: some HTML {
        Section{
            Text(title)
                .horizontalAlignment(.leading)
                .font(.title3)
            Text{
                Link("home", target: "/")
                    .style(.textDecoration, "none")
                    .style(.color, "#aaa")
                    .style(.fontSize, "1.0em")
            }.horizontalAlignment(.trailing)
                .style(.marginTop, "-42px")
        }.padding(.top, 20)
    }
}
