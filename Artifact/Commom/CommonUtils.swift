//
//  CommonUtils.swift
//  Artifact
//
//  Created by Richa Kalani on 28/05/26.
//
 import Foundation

class CommonUtils {
    func formatDate(_ isoString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()

        guard let date = isoFormatter.date(from: isoString) else {
            return isoString
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"

        return formatter.string(from: date)
    }
}
