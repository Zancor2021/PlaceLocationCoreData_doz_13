import SwiftUI

struct AddMovie: View {
  static let DefaultMovieTitle = "An untitled masterpiece"
  static let DefaultMovieGenre = "Genre-buster"

  @State var title = ""
  @State var genre = ""
  @State var releaseDate = Date()
 
 @ObservedObject var dm:DataController = DataController()
    
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Title")) {
          TextField("Title", text: $title)
        }
        Section(header: Text("Genre")) {
          TextField("Genre", text: $genre)
        }
        Section {
          DatePicker(
            selection: $releaseDate,
            displayedComponents: .date) {
              Text("Release Date").foregroundColor(Color(.gray))
          }
        }
        Section {
            Button(action:{ self.dm.createData()}) {
              Text("add")
            }
         
        }
      }
      .navigationBarTitle(Text("Add Movie"), displayMode: .inline)
    }
  }

  
}
