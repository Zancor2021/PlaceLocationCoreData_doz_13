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
    
  
    
    
    @Published var allPlace:[Place] = []
    
    func getData(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
        
        allPlace = try! managedObjectContext.fetch(fetchRequest) as! [Place]
        //print(allPlace[0].title!)
    }
    
   
    init(){
          //print(getTest)
       getPath2()
        
      }
    
    func createData(t:String,lat:Double,lon:Double,c:Int16,i:Data,r:Int16,d:Date){
         let pSave:Place = Place(context: managedObjectContext)
       
            pSave.id = UUID()
        pSave.category = c      // Picker
        pSave.title = t   // TExtfield
        pSave.lat = lat // TExtfield
        pSave.lon = lon // TExtfield
            pSave.img  = i
        pSave.ranking = r  // Stepper
        pSave.date = d //DatePicker
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
