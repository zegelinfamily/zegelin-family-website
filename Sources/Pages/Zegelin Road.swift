import Foundation
import Ignite


struct EndPoint: Codable {
    let LatLong: String
    let Mode: Int
}
    

struct ZegelinRoad: StaticPage {
    @Environment(\.decode) var decode

    var title = "Zegelin Road"
    
    var layout = ZegelinRoadLayout()
    
    var body: some HTML {
        let page = decode.data(forResource:"zegelin-road.md")!
        let str = String(decoding: page, as: UTF8.self)
        
        let map = createMap(bounds: "[-36.303484, 144.656346],[-36.566715, 145.225575]")
        let navControls = navControls()
        let points = [EndPoint(LatLong: "-36.343455, 144.711514", Mode: 0),
                      EndPoint(LatLong: "-36.343489, 144.743014", Mode: 0),
                      EndPoint(LatLong: "-36.342003, 144.743014", Mode: 0),
                      EndPoint(LatLong: "-36.342003, 144.777475", Mode: 100),
                      EndPoint(LatLong: "-36.513651, 144.986290", Mode: 0),
                      EndPoint(LatLong: "-36.513654, 145.082311", Mode: 0),
        ]
        let curves = mapCurves(stops: points)
        
        Heading(title: title)
        
        Text(markdown: str)
            .margin(.top, 40)
        
        /// Map
        Section{
            /// This is where the map will appear because this section has a 'map' id
            /// This script creates the map and adds curves and other items
            Script(code: map  + curves + navControls)
        }.id("map")
    }
}


/// Create a map using the passed in bounds
func createMap(bounds: String) ->String{
    
    return """
        const map = L.map('map',{
            zoomDelta: 0.25,    // Controls zoom increment (default is 1)
            zoomSnap: 0.25,     // Snaps zoom to multiples of this value (default is 1)
            zoomControl: false
        });
        
        
        // Add OpenStreetMap tiles
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
           attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
        }).addTo(map);
        
        // Fit the map to the bounds with optional padding
        map.fitBounds([\(bounds)],{
        });
    """
}


/// Add zoombar and navbar.
func navControls() ->String{
   
    return """
        var zoom_bar = new L.Control.ZoomBar({position: 'topleft'}).addTo(map);
        L.control.navbar().addTo(map);
    """
}


func parsePoint(from string: String) ->CGPoint{
    /// Split the string by comma and trim whitespace
    let components = string.split(separator: ",").map{ $0.trimmingCharacters(in: .whitespaces) }

    return CGPoint(x:Double(components[0])!, y:Double(components[1])!)
}


/// Draw curves between markers. Uses leaflet.curve.js
func mapCurves(stops: [EndPoint]) ->String{
    var curveListStr = ""

    guard stops.count > 0 else { return "" }

    (0...stops.count - 2).forEach{ index in
        let start = parsePoint(from: stops[index].LatLong)
        let end = parsePoint(from: stops[index + 1].LatLong)
        let mode = stops[index].Mode

        if mode != 100{
            let e = CGPoint(x:end.x - start.x, y:end.y - start.y)               /// endpoint (end relative to start)
            let m = CGPoint(x:e.x/2, y:e.y/2)                                   /// midpoint
            let c = CGPoint(x:m.x, y:m.y)                                       /// curve control point

            let curve = """
                var curve = L.curve(
                [
                 'M', [\(start.x),\(start.y)],
                 'Q', [\(start.x + c.x),\(start.y + c.y)],
                 [\(end.x),\(end.y)]
                ],
                {
                 color: 'blue',
                 weight: 6.0,
                 opacity: 0.4
                }
                ).addTo(map);
            """
            curveListStr += curve
        }
    }

    return curveListStr
}
