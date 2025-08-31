import Foundation
import Ignite


/// This generates the front page of the website
struct Home: StaticPage {
    @Environment(\.decode) var decode
   
    var title = "Zegelin Family Website"
    
    var body: some HTML {
        Grid(alignment: .topLeading){
            /// Sidebar
            Section{
                /// Zegelin Family
                Text("Zegelin Family").font(.title4)
                List{
                    ListItem{ Link("Family Tree", target: FamilyTree()) }
                    ListItem{ Link("Some Old Pictures", target: Pictures()) }
                    ListItem{ Link("Zegelin Road", target: ZegelinRoad()) }
                    ListItem{ Link("Contact", target: Contact()) }
                }.class("sidebar-list")
                
                /// Peter
                ListItem{ Link("Peter", target: "/peter") }
                    .font(.title4)
                    .margin(.top, 20)
            }.class("sidebar")
            .width(2)
            .position(.stickyTop)
            .margin(.top, 200)
 
            /// Main text
            Section{
                let page = decode.data(forResource:"family-history.md")!
                let str = String(decoding: page, as: UTF8.self)
                
                Section{
                    Section{
                        Text("Welcome to the Zegelin Family web site").font(.title2)
                    }.margin(.bottom, 15)

                    Text("This site is dedicated to the memory of Karl and Frieda Zegelin. Karl was born in 1889 and died in 1977. Frieda was born in 1888 and died in 1970. They emigrated from Germany to Australia in 1913 and settled in Rochester, Victoria. The family has thrived in Australia.")
                    Grid{
                        Card(imageName: "/images/Frieda Zegelin 1910.jpg") {
                            Text(markdown:"*Frieda Zegelin - née Lortz. c. 1910*").horizontalAlignment(.center)
                        }
                        Card(imageName: "/images/Karl Zegelin 1912.jpg") {
                            Text(markdown:"*Karl Friedrich Zegelin. c. 1912*").horizontalAlignment(.center)
                        }
                    }.columns(2)
                    .padding([.leading,.trailing], 100)
                }.horizontalAlignment(.center)
                Text("The Zegelin Clan in Australia and the USA (according to George Zegelin)")
                    .font(.title5)
                    .padding([.top, .bottom], 20)
                Text(markdown: str)
            }
        }.padding(.top, 40)
    }
}


