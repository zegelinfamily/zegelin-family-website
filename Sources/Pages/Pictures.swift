import Foundation
import Ignite

struct Pictures: StaticPage {
    var title = "Some Old Pictures"

    var body: some HTML {
        
        Heading(title: title)
        
        Text("Images taken from the manuscript 'Some Early History of the Zegelin and Lortz Families'")
        Text("More pictures coming!")

        Grid {
            Card(imageName: "/images/Gustav + Ida Zegelin 1920.jpg") {
                Text(markdown: "*Gustav & Ida Zegelin 1920*").horizontalAlignment(.center)
            }
            
            Card(imageName: "/images/Karl Zegelin aged 16 c. 1905.jpg") {
                Text(markdown:"*Karl Zegelin aged 16 c. 1905*").horizontalAlignment(.center)
            }

            Card(imageName: "/images/Gustav Zegelin + Family, Ahlbeck, c.1904.jpg") {
                Text(markdown:"*Ahlbeck, c.1904: Ida, Karl, Gustav</br>Below: Elfriede & Else*").horizontalAlignment(.center)
            }
            
            Card(imageName: "/images/Zegelin Residence (Stettin) c. 1918.jpg") {
                Text(markdown:"*Zegelin Residence (Stettin) c. 1908</br>84 Langestrasse, Finkenwalde*").horizontalAlignment(.center)
            }
            
            Card(imageName: "/images/First Grenadier Guard Regiment, Berlin.jpg") {
                Text(markdown:"*First Grenadier Guard Regiment, Berlin - 'Kaiser Alexander'</br>Karl Zegelin, Front Rank, 4th from Left*").horizontalAlignment(.center)
            }
            
            Card(imageName: "/images/Karl Zegelin c. 1909.jpg") {
                Text(markdown:"*Karl Zegelin. circa 1909*").horizontalAlignment(.center)
            }

            Card(imageName: "/images/Wittstock-am-Dosse c. 1906.jpg") {
                Text(markdown:"*Wittstock-am-Dosse c. 1906</br>Karl Zegelin - 2nd from Left*").horizontalAlignment(.center)
            }
        }.columns(4)
    }
}


