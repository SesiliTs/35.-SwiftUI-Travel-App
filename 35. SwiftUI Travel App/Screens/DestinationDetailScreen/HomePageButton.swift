//
//  HomePageButton.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 15.12.23.
//

import SwiftUI

struct HomePageButton: View {
    
    @EnvironmentObject var viewmodel: MainScreenViewModel
    
    var body: some View {
        VStack {
            Button("Home Page") {
                viewmodel.navigationPath.removeLast(viewmodel.navigationPath.count)
            }
            .buttonStyle(BorderlessButtonStyle())
            .font(.system(size: 18, weight: .bold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.cyan)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .clipped()
        }        
    }
}
