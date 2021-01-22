    

import SwiftUI

 import UIKit
    import CoreData
    
    
    class DataController:ObservableObject{
        
        var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        @Published var allPlace:[Place] = []
        
        func getData(){
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
            allPlace = try! managedObjectContext.fetch(fetchRequest) as! [Place]
            print(allPlace[0].title!)
        }
        
        func createData(){
            
            let p:Place = Place(context: managedObjectContext)
                p.id = UUID()
                p.category = 0
                p.title = "Beach"
                p.lat = 52.13123121
                p.lon = 13.13123121
                p.img  = UIImage().jpegData(compressionQuality: 0.9)
                p.ranking = 4
                p.date = Date()
            try! managedObjectContext.save()
            getData()
         }
    }
    
    
    
    
struct ListView: View {
    
    @ObservedObject var dm:DataController = DataController()
    @State var isPresented = false
  var body: some View {
    
    NavigationView {
      List {
        ForEach(self.dm.allPlace, id: \.title) {
             ListRow(place: $0)
        }
        
      }.onAppear{
        self.dm.createData()
        self.dm.getData()
        
      }
      .sheet(isPresented: $isPresented) {
        AddMovie()
      }
      .navigationBarTitle(Text("Fave Flicks"))
      .navigationBarItems(trailing:
        Button(action: { self.isPresented.toggle() }) {
          Image(systemName: "plus")
        }
      )
    }
    }
    
  }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    // @State var isPresented = false
    
    
    
    
    
    
    
   /* NavigationView {
      List {
        ForEach(movies, id: \.title) {
         // MovieRow(movie: $0)
        }
        .onDelete(perform: deleteMovie)
      }
      .sheet(isPresented: $isPresented) {
        AddMovie { title, genre, release in
          self.addMovie(title: title, genre: genre, releaseDate: release)
          self.isPresented = false
        }
      }
      .navigationBarTitle(Text("Fave Flicks"))
      .navigationBarItems(trailing:
        Button(action: { self.isPresented.toggle() }) {
          Image(systemName: "plus")
        }
      )
    }
  }

  func deleteMovie(at offsets: IndexSet) {
    // 1.
    offsets.forEach { index in
      // 2.
      let movie = self.movies[index]

      // 3.
      self.managedObjectContext.delete(movie)
    }

    // 4.
    saveContext()
  }


  func addMovie(title: String, genre: String, releaseDate: Date) {
    // 1
    let newMovie = Movie(context: managedObjectContext)

    // 2
    newMovie.title = title
    newMovie.genre = genre
    newMovie.releaseDate = releaseDate

    // 3
    saveContext()
  }


  func saveContext() {
    do {
      try managedObjectContext.save()
    } catch {
      print("Error saving managed object context: \(error)")
    }
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList()
  }
}
*/
    
