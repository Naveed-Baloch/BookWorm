//
//  RatingView.swift
//  BookWorm
//
//  Created by Naveed on 27/08/2024.
//

import Foundation
import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1...maximumRating, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    Image(systemName: "star.fill")
                        .foregroundColor(number > rating ? Color.gray : Color.yellow)
                        .padding(.horizontal, 2)
                }
            }
        }
    }
    
}

#Preview {
    RatingView(rating: .constant(3))
}
