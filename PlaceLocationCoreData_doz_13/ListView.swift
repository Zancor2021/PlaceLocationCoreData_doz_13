    

import SwiftUI

 import UIKit
    import CoreData
    
    

    
    
    
    
struct ListView: View {
    
    @ObservedObject var dm:DataController = DataController()
    @State var isPresented = false
  var body: some View {
    
    NavigationView {
      List {
        ForEach(self.dm.allPlace, id: \.id) {
           
                ListRow(place: $0)
            
        }.onDelete(perform: dm.deletePlace(at:))
        
      }.onAppear{
        //self.dm.createData()
        self.dm.getData()
        
      }
      .sheet(isPresented: $isPresented.didSet(execute: { (state) in
        if(!self.isPresented){ self.dm.getData() }
      })) {
        AddPlace(isPresented: self.$isPresented)
      }
      .navigationBarTitle(Text("Places"),displayMode: .inline)
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
    
