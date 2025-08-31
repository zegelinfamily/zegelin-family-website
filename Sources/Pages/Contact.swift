import Foundation
import Ignite


struct Contact: StaticPage {
    var title = "Contact"

    var body: some HTML {
        Heading(title: title)
        
        Section{
            Text("If you are a Zegelin family member with a website you would like to share, please contact me and I can add a link to it on the main page.")
            Text("Questions or comments about this website should be directed to:")
            Include("email-address.html")
        }.padding(.top,40)
    }
}
