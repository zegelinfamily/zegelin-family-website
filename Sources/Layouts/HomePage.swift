import Foundation
import Ignite

struct HomePage: Layout {
    var body: some Document {
        Head{
            /// Add css for the page layout
            MetaLink(href: "/css/site.css", rel: .stylesheet)
        }
        Body {
            content
            Footer()
        }
    }
}


struct Footer: HTML {
    
    var body: some HTML {
        Section{
            Text("© 2018 - <span id='currentYear'></span> Peter Zegelin |&nbsp;")
            /// JavaScript to dynamically update the date
            Script(code: "document.getElementById('currentYear').textContent = new Date().getFullYear();")
            Text {
                "Created in Swift with "
                Link("Ignite", target: URL(static: "https://github.com/twostraws/Ignite"))
            }
            Text {
                "&nbsp;| Source Code for this site is at "
                Link("GitHub ", target: URL(static: "https://github.com/zegelinfamily/our-travels"))
            }
        }.class("d-flex justify-content-center")  /// 'bootstrap' - place side by side
        .margin(.small)
        .style(.fontSize, "0.8em")
    }
}
