//
//  AddTrashBinView.swift
//  Segrebox
//
//  Created by Clarabella Lius on 26/10/23.
//

import SwiftUI

struct AddTrashBinView: View {
    @State private var eventname = ""
    @State private var eventdesc = ""
    @State private var image: Image?
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    let context = CIContext()
        
        var body: some View {
            HStack {
                VStack(alignment: .leading){
                    
                    HStack {
                        Spacer()
                        Text("Add Trash Bin")
                            .font(.custom("PlusJakartaSans-Bold", size: 31))
                            .padding(.bottom, 39)
                        Spacer()
                    }
                    .frame(width: 600)
                    
                    //MARK: Select UUID
                    HStack{
                        Text("UUID")
                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                            .padding(.bottom, 41)
                        
                        TextFieldComponent(text: $eventname, placeholder: "Add an event name", keyboardType: .default, returnKeyType: .next, width: 400, height: 40, axis: .vertical)
                            .padding(.bottom, 41)
                            .padding(.leading, 164)
                    }
                    
                    //MARK: Add trash bin name
                    HStack{
                        Text("Trash Bin Name")
                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                            .padding(.bottom, 41)
                        
                        TextFieldComponent(text: $eventdesc, placeholder: "Add trash bin name", keyboardType: .default, returnKeyType: .next, width: 400, height: 40,axis: .vertical)
                            .padding(.bottom, 48)
                            .padding(.leading, 62)
                            .onChange(of: eventdesc) {
                                if eventdesc.count > 150 {
                                    eventdesc = String(eventdesc.prefix(150))
                                }
                            }
                    }
                    
                    //MARK: Add trash bin details
                    HStack{
                        Text("Trash Bin Details")
                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                            .padding(.bottom, 41)
                        
                        VStack {
                            TextFieldComponent(text: $eventdesc, placeholder: "Add trash bin details", keyboardType: .default, returnKeyType: .next, width: 400, height: 40,axis: .vertical)
                                .onChange(of: eventdesc) {
                                    if eventdesc.count > 150 {
                                        eventdesc = String(eventdesc.prefix(150))
                                    }
                                }
                            
                            HStack {
                                Text("max. 150 characters")
                                    .font(.custom("PlusJakartaSans-Regular", size: 14))
                                    .foregroundStyle(Color.gray)
                                Spacer()
                            }

                            .frame(width: 400)
                        }
                        .padding(.bottom, 12)
                        .padding(.leading, 50)
                    }

                    //MARK: Add Trash bin Image
                    HStack {
                        Text("Trash Bin Image")
                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                            .padding(.top, 10)
//                            .padding(.bottom, 50)
                        
                        //Upload an image
                        ZStack{
                            RoundedRectangle(cornerRadius: 8.0)
                                .frame(width: 176, height: 31)
                                .foregroundColor(Color("grey-light-active"))
                            
                            Text("Upload an image")
                                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                                .frame(width: 130, height: 20)
                            
                            image?
                                .resizable()
                                .scaledToFit()
                               
                        }
                        .padding(.leading, 57)
                        .padding(.top, 10)
//                        .padding(.bottom, 10)
                        .onTapGesture {
                            showingImagePicker = true
                        }
                        
                        image?
                            .resizable()
                            .scaledToFit()
                    }
                    .sheet(isPresented: $showingImagePicker) {
                            ImagePicker(image: $inputImage)
                    }
                    
                    //MARK: Add Trash Bin Button
                    HStack {
                        Spacer()
                        Button("Add Trash Bin"){
                        }.buttonStyle(SecondaryButtonStyle(textPlaceholder: "Add Trash Bin"))
                    }
                    .frame(width: 630)
                    .padding(.top, 87)
//                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
                }
            }
        }
    
    func save() {

        let imageSaver = ImageSaver()

        imageSaver.successHandler = {
            print("Success!")
        }

        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }

        imageSaver.writeToPhotoAlbum(image: processedImage ?? UIImage(named: "defaultImage")!)
    }
    
}

#Preview {
    AddTrashBinView()
}
