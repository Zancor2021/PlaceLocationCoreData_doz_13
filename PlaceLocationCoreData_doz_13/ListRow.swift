
import SwiftUI

struct ListRow: View {
  let place: Place
  let releaseFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()
    @State var image: Image? = nil
       @State var imageUI: UIImage? = nil

  var body: some View {
    NavigationLink(destination: DetailView(p:place)){
    VStack(alignment: .leading) {
       HStack {
         image?.resizable().frame(width: 50.0, height: 50.0)
         VStack{
                place.title.map(Text.init)
                .font(.title)
              HStack {
               Text("\(place.category)")
                  .font(.caption)
                Text("\(releaseFormatter.string(from: place.date!) )")
                .font(.caption)
                Spacer()
               Text("\(place.ranking)")
               .font(.caption)
              }
            }
        }
       }.onAppear{
        self.imageUI = UIImage(data: self.place.img!)
        self.image = Image(uiImage: self.imageUI!)
        }
        
    }
  }
}
