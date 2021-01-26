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
import CoreLocation

class DataController:ObservableObject{
    
     @Published var categories = ["sight","food", "club","cultur"]
    @Published var currentDistance:Double = 3
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
    @Published var allPlaceLoad:[Place] = []
    func getData(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
        
        allPlaceLoad = try! managedObjectContext.fetch(fetchRequest) as! [Place]
        //print(allPlace[0].title!)
        filterData()
    }
    
    func filterData(){
        allPlace = []
        let coordinate1 = CLLocation(latitude: 52.515176, longitude:13.470591)
        

        for item in allPlaceLoad{
            let coordinate2 = CLLocation(latitude: item.lat, longitude: item.lon)
            if(calculateDistance(gps1: coordinate1, gps2: coordinate2) <= currentDistance ){
                //item.distance = calculateDistance(gps1: coordinate1, gps2: coordinate2)
                allPlace.append(item)
            }
        }
    }
    
    func calculateDistance(gps1:CLLocation,gps2:CLLocation)-> Double{
        return gps1.distance(from: gps2)/1000
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
