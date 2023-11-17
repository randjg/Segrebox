//
//  CardComponent.swift
//  Memilah
//
//  Created by Randy Julian on 23/10/23.
//

import SwiftUI

struct BinCardComponent: View {
    @EnvironmentObject var viewModel: TrashBinViewModel
    var trashBin: TrashBinModel
    @State var trashBinImage: Data?
    //    @Binding var binStatus: binStatus
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.white)
            
            HStack{
                if let trashBinImage, let image = UIImage(data: trashBinImage) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 224, height: 241)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 30)
                } else {
                    ProgressView {
                        Text("Image Unavailable")
                    }
                    .controlSize(.large)
                    .frame(width: 224, height: 241)
                    .padding(.horizontal, 30)
                }
                
                VStack {
                    HStack {
                        VStack(alignment: .leading){
                            HStack {
                                Text(trashBin.name)
                                    .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                                    .foregroundStyle(Colors.adaptiveFontColorCard)
                                
                                BinStatusComponent()
                                    .frame(maxWidth: 140)
                            }
                            .padding(.top, 20)
                            .padding(.bottom, 8)
                            
                            Text(trashBin.documentID ?? "No UUID")
                                .font(.custom(Fonts.plusJakartaSansRegular, size: 13))
                                .foregroundStyle(Colors.adaptiveFontColorCard)
                                .padding(.bottom, 8)
                            
                            Text(trashBin.detail)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(2)
                                .font(.custom(Fonts.plusJakartaSansRegular, size: 13))
                                .foregroundStyle(Colors.adaptiveFontColorCard)
                                .frame(width: 199, alignment: .leading)
                        }
                        .padding(.bottom, 10)
                        
                        Spacer()
//                            .frame(maxWidth: 100)
                    }
                    
                    Divider()
                        .frame(width: 500)
                        .overlay(Color(Colors.orangeLight))
                    
                    
                    VStack{
                        HStack {
                            Text("Fill Level")
                                .font(.custom(Fonts.plusJakartaSansBold, size: 21))
                                .foregroundStyle(Colors.adaptiveFontColorCard)
                            
                            Spacer()
                            Text("Last updated " + (trashBin.getTimeUpdatedDate()?.formatDateHourMinute() ?? ""))
                                .font(.custom("PlusJakartaSans-Italic", size: 13))
                                .foregroundStyle(Colors.adaptiveFontColorCard)
                        }
                        .padding(.top, 8)
                        .padding(.bottom, -5)
                        
                        ZStack{
                            VStack{
                                HStack{
                                    PillShapeFillLevel(fillPercentage: trashBin.levelPaper, category: "Paper", color: Color.red)
                                    PillShapeFillLevel(fillPercentage: trashBin.levelPlastic, category: "Plastic", color: Color.yellow)
                                    PillShapeFillLevel(fillPercentage: trashBin.levelOthers, category: "Others", color: Color.green)
                                }
                            }.frame(height: 100) //dibikin responsive
                        }
                    }
                }
                .frame(maxWidth: 480)
            }
        }
        .frame(width: 819, height: 321)
        .onAppear {
//            Task {
//                let imageData = try? await viewModel.getImage(imagePath: trashBin.imageUrl)
//                trashBinImage = imageData
//            }
            viewModel.getImage(imagePath: trashBin.imageUrl) { data in
                trashBinImage=data
            }
        }
        
    }
}

#Preview {
    BinCardComponent(
        trashBin: .dummy
    )
    .environmentObject(TrashBinViewModel())
}
