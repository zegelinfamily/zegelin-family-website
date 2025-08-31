import Foundation
import Ignite


import Foundation
import Ignite


struct ZegelinRoadLayout: Layout {
    var body: some Document {
        Head{
            /// Add css for the trip page layout
            MetaLink(href: "/css/peter.css", rel: .stylesheet)
            
            /// Add leaflet
            MetaLink(href: "/map/css/leaflet.css", rel: .stylesheet)
            Script(file: "/map/leaflet/leaflet.js")
            
            /// Add leaflet plugin to create bezier curves
             Script(file: "/map/leaflet/leaflet.curve.js")
                            
            /// Add a zoombar
            MetaLink(href: "/map/zoombar/L.Control.ZoomBar.css", rel: .stylesheet)
            Script(file: "/map/zoombar/L.Control.ZoomBar.js")
            
            /// Add a navbar - gives forward and back buttons through navigation history
            MetaLink(href: "/map/navbar/Leaflet.NavBar.css", rel: .stylesheet)
            Script(file: "/map/navbar/Leaflet.NavBar.js")

            /// Add css for the trip page layout
            MetaLink(href: "/map/css/zegelinroad.css", rel: .stylesheet)
        }
        Body {
            Section{
                content
            }
        }
    }
}
