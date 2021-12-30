//
//  ImageManager.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import Photos
import UIKit

protocol ImageLoaderManager{
    
}


class ImageLoaderManagerImpl{
    
    func requestPhoto(_ action: (()->Void)?, completion : @escaping ((Bool, CustomError?)->())){
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
                case .authorized:
                    completion(true, nil)
                    action?()
                    break
                case .notDetermined:
                    completion(false, .notFound)
                    break
                default:
                    break
            }
        }
    }
    
    
    func loadImage(for asset: PHAsset, with targetSize : CGSize, _ isSynchronous : Bool = false, 
                completion : @escaping ((UIImage?, CustomError?) -> Void)) {
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isSynchronous = true
        let targetSize = CGSize(width: asset.pixelWidth, height: asset.pixelHeight)
        PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: .default, options: options) { (image, _) in
            
            if image != nil{
                completion(image, nil)
            }else{
                completion(image, .notFound)
            }
//            DispatchQueue.main.async {
//                self.scrollView.image = image
//            }
        }
    }
    
    
}
