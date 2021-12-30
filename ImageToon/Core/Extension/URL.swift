//
//  File.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/30/21.
//

import AVFoundation
import UIKit

extension URL {
    func generateThumbnail() -> UIImage? {
        do {
            let asset = AVURLAsset(url: self)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            
            // Swift 5.3
            let cgImage = try imageGenerator.copyCGImage(at: .zero,
                                                         actualTime: nil)
            
            return UIImage(cgImage: cgImage)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

extension AVAsset{
    func generateThumbnail() -> UIImage? {
        do {
            let imageGenerator = AVAssetImageGenerator(asset: self)
            imageGenerator.appliesPreferredTrackTransform = true
            
            // Swift 5.3
            let cgImage = try imageGenerator.copyCGImage(at: .zero,
                                                         actualTime: nil)
            
            return UIImage(cgImage: cgImage)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

}
