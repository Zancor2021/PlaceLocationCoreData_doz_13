//
//  DataController.swift
//  PlaceLocationCoreData_doz_13
//
//  Created by Alexander Hoch on 25.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataController:ObservableObject{
    
     @Published var categories = ["sight","food", "club","cultur"]
    //HOLE BESTEHENDE VERBINDUNG ZUR DB -> persistentContainer
    //persistentContainer.viewContext -> Schnitstelle für methoden wie save,fetch,update ...
    var managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //var getTest = (UIApplication.shared.delegate as! AppDelegate).test
    func getPath2()->URL{
           let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("todos8.plist")
           print(path)
          return path
       }
    
    init(){
        //print(getTest)
        getPath2()
    }
    
    
    @Published var allPlace:[Place] = []
    
    func getData(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
        
        allPlace = try! managedObjectContext.fetch(fetchRequest) as! [Place]
        //print(allPlace[0].title!)
    }
    
    func createData(){
        
        let p:Place = Place(context: managedObjectContext)
            p.id = UUID()
            p.category = 0        // TExtfield
            p.title = "Adlon"    // TExtfield
            p.lat = 52.13123121 // TExtfield
            p.lon = 13.13123121 // TExtfield
            p.img  = UIImage().jpegData(compressionQuality: 0.9)
            p.ranking = 4  // Stepper
            p.date = Date() //DatePicker
        try! managedObjectContext.save()
        getData()
     }
    
    func deletePlace(at offsets: IndexSet) {
      
       offsets.forEach { index in
         let obj = self.allPlace[index]
         self.managedObjectContext.delete(obj)
       }

      
       try! managedObjectContext.save()
       getData()
     }
}
