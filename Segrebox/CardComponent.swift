//
//  CardComponent.swift
//  Segrebox
//
//  Created by Randy Julian on 23/10/23.
//

import SwiftUI

struct CardComponent: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2.0)
                    )
                    .frame(width: 800, height: 321)
                
                HStack{
                    Image("image 4")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 224, height: 241)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading){
                                HStack {
                                    Text("Nama Tempat Trashbin")
                                            .font(.custom("PlusJakartaSans-Bold", size: 21))
                                            .foregroundStyle(Color("AdaptiveFontColorCard"))
                                    PillShapeStatus(color: Color(red: 0.09, green: 0.7, blue: 0.39), text: "Connected")
                                        .frame(maxWidth: 140)
                                }
                                .padding(.bottom, 8)
                                    Text("UUID")
                                        .font(.custom("PlusJakartaSans-Regular", size: 13))
                                        .foregroundStyle(Color("AdaptiveFontColorCard"))
                                        .padding(.bottom, 8)
                                    Text("Deskripsi trash bin")
                                        .lineLimit(3)
                                        .multilineTextAlignment(.leading)
                                        .lineSpacing(2)
                                        .font(.custom("PlusJakartaSans-Regular", size: 13))
                                        .foregroundStyle(Color("AdaptiveFontColorCard"))
                                        .frame(width: 199, alignment: .leading)
                                }
                            .padding(.bottom, 10)
                            Spacer()
                                .frame(maxWidth: 100)
                        }
                        
                        Divider()
                            .frame(width: 500)
                            .overlay(Color(red: 0.98, green: 0.84, blue: 0.77))

                        
                        VStack{
                            HStack {
                                Text("Fill Level")
                                    .font(.custom("PlusJakartaSans-Bold", size: 21))
                                    .foregroundStyle(Color("AdaptiveFontColorCard"))
                                Spacer()
                                Text("Last updated 20.05")
                                    .font(.custom("PlusJakartaSans-Italic", size: 13))
                                    .foregroundStyle(Color("AdaptiveFontColorCard"))
                            }
                            .padding(.top, 10)
                            .frame(maxWidth: 480)
                            
                            ZStack{
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color(red: 0.93, green: 0.95, blue: 0.96)) //ganti warna nya
//                                    .frame(width: 375, height: 175) //dibikin responsive
                                
                                VStack{
//                                    Text("Fill Level")
//                                        .font(.custom("PlusJakartaSans-Regular", size: 24))
//                                        .bold()
//                                        .foregroundColor(.black)
//                                        .padding(.vertical, 15)
                                    
                                    HStack{
                                        PillShapeFillLevel(fillPercentage: 50, category: "Paper", color: Color.red)
                                        PillShapeFillLevel(fillPercentage: 60, category: "Plastic", color: Color.yellow)
                                        PillShapeFillLevel(fillPercentage: 90, category: "Others", color: Color.green)
                                    }
                                }.frame(width: 488, height: 100) //dibikin responsive
                            }
                        }
                    }
//                    .padding(.leading, -10)
                }
            }
            .frame(width: geometry.size.width)
        }
    }
}

#Preview {
    CardComponent()
}
