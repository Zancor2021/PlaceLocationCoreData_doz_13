import SwiftUI
import  UIKit
struct AddPlace: View {
 
  
 @ObservedObject var dm:DataController = DataController()
    
    @Binding var isPresented:Bool
    
    @State var showImagePicker: Bool = false
     @State var image: Image? = nil
    @State var imageUI: UIImage? = nil
    
    @State var title:String = "Alex Home"
    @State var lat:String = "52.515438"
    @State var lon:String = "13.470627"
    @State var category:Int = 0
    @State var date:Date = Date()
    @State var ranking:Int = 0
    @State var img:Data = Data()
    
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Title")) {
            TextField("Title", text: $title)
        }
        Section(header: Text("Position")) {
            HStack{
                TextField("lat", text: $lat)
                TextField("lon", text: $lon)
                
            }
        }
       Section(header: Text("Category")) {
          Picker(selection: $category, label: Text("Categorie")) {
                           ForEach(0 ..< dm.categories.count) {
                               Text(self.dm.categories[$0])
                          }
                       }
            
        }
        Section(header: Text("Ranking")) {
        Stepper(value: $ranking, in: 1...5, label: { Text("ranking:  \(ranking)")}).padding()
        }
        
        Section {
          DatePicker(
            selection: $date,
            displayedComponents: .date) {
              Text("Release Date").foregroundColor(Color(.gray))
              //  UIToSwiftView().frame(width: 100, height: 100, alignment: .center)
          }
        }
        
        Section {
              Section(header: Text("Choose Image")) {
                HStack{
             image?.resizable().frame(width: 50.0, height: 50.0)
            Button(action:{
                self.showImagePicker = true
            }) {
              Text("add image")
                    }}
              }.onAppear{
                self.image = Image("default_image")
                self.imageUI = UIImage(named: "default_image")
            }
        }.sheet(isPresented: $showImagePicker) {
           
               ImagePicker(sourceType: .photoLibrary) { image in
                   self.imageUI = image
                   self.image = Image(uiImage: image)
            }}
        
        
        
        Section {
            Button(action:{
               
                
                
                self.dm.createData(t:self.title,lat:Double(self.lat)!,lon:Double(self.lon)!,c:Int16(self.category),i:(self.imageUI?.jpegData(compressionQuality: 0.9)!)!,r:Int16(self.ranking),d:self.date)
                self.isPresented = false
                
                
            }) {
              Text("add")
            }
         
        }
      }
      .navigationBarTitle(Text("Add Movie"), displayMode: .inline)
    }
  }

  
}
