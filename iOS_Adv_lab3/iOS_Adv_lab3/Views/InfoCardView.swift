//
//  InfoCardView.swift
//  iOS_Adv_lab3
//
//  Created by Zhaniya Utemuratova on 07.03.2026.
//

import SwiftUI

struct InfoCardView: View {
    let title: String
    let items: [(String, String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(.title3.bold())

            ForEach(items, id: \.0) { item in
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.0)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text(item.1.isEmpty ? "Unknown" : item.1)
                        .font(.body)
                }

                if item.0 != items.last?.0 {
                    Divider()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
