//
//  PowerStatRow.swift
//  iOS_Adv_lab3
//
//  Created by Zhaniya Utemuratova on 07.03.2026.
//

import SwiftUI

struct PowerStatRow: View {
    let title: String
    let value: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
                Text("\(value)")
                    .foregroundStyle(.secondary)
            }

            ProgressView(value: Double(value), total: 100)
                .tint(Color(red: 131/255, green: 55/255, blue: 127/255))
        }
    }
}
