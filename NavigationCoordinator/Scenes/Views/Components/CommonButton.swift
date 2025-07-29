//
//  CommonButton.swift
//  NavigationCoordinator
//
//  Created by Anushka Samarasinghe on 2025-07-29.
//

import SwiftUI

struct CommonButton: View {
    //MARK: - PROPERTIES
    let title: String
    let isFilled: Bool
    let isFullWidth: Bool
    @State var fontSize:CGFloat = 16
    @State var cornerRadius:CGFloat = 25
    @State var buttonColor: Color? = .accent
    @State var isImg: Bool?
    @State var imageName = ""
    @State var imageWidth: CGFloat = 24
    @State var imageHeight: CGFloat = 24
    @State var borderWidth: CGFloat?
    @State var buttonWidth: CGFloat = 219
    @State var buttonHeight: CGFloat = 48
    let action: (() -> Void)?
    
    var body: some View {
        //MARK: - BODY
        VStack {
            Button {
                action?()
            } label: {
                HStack(spacing: 12) {
                    if isImg == true {
                        Image(imageName)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: imageWidth, height: imageHeight)
                            .foregroundColor(.accent)
                    }
                    Text(title)
                        .font(.system(size: fontSize, weight: .medium, design: .default))
                        .padding(.vertical, 12)
                        .foregroundStyle(self.isFilled ? .white : (buttonColor != nil ? buttonColor! : .black).opacity(0.7))
                } //:HStack
                .frame(maxWidth: isFullWidth == true ? UIScreen.main.bounds.width : buttonWidth, maxHeight: buttonHeight)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(self.isFilled ? (buttonColor != nil ? buttonColor! : .accent) : .clear)
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(self.isFilled ? .clear : buttonColor != nil ? buttonColor! : .accent, lineWidth: borderWidth ?? 1)
                    } //:ZStack
                )
            } //:Button
            .shadow(color: .gray.opacity(0.1), radius: 5, x: 0, y: 2)
        } //:VStack
    }
}

#Preview {
    CommonButton(title: "Button", isFilled: true, isFullWidth: false, action: {})
}
