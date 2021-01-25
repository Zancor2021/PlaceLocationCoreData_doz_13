//
//  MySheet.swift
//  FileUploadToServer_doz_12
//
//  Created by Alexander Hoch on 16.04.20.
//  Copyright © 2020 zancor. All rights reserved.
//

import Foundation
import SwiftUI
struct MySheet:View{
    
    @Environment(\.presentationMode)
       private var presentationMode
    
  
    
    
    
    var body: some View {
        VStack{
            Text("LALELU")
            Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                    }) {
                            Text("close Sheet")
                    }
        }
    }
    
}
