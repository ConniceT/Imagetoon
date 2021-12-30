//
//  PhotoMainController.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/25/21.
//

import UIKit
import Photos
import Metal
import MetalKit



class PhotoListController : UIViewController {
    
    var photoView = UIView()
    var albumView =  UIView()
    fileprivate var scrollView: ToonScrollView!
    fileprivate var selectedAsset: PHAsset?
    var cameraButton : UIButton!
    var photoGalleryButton : UIButton!
    var imagePicker: ImagePicker!

    
    fileprivate var albumController: AlbumPhotoViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        setupScrollView()
        requestPhoto()
        test()
    }
    
    private func test() {
        
    }
    
    private func setupScrollView() {
        
        photoView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4))
        scrollView = ToonScrollView(frame: photoView.bounds)
        cameraButton = view.generateImageButton(image: UIImage(systemName: "camera") ?? UIImage())
        
        photoView.addSubview(scrollView)
        
        view.addSubviews(photoView, albumView, cameraButton)
        
        photoView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, 
                         bottom: nil, trailing: view.trailingAnchor)
        photoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4).isActive = true
        
        let leftBarItem = UIBarButtonItem(image: UIImage(systemName: "camera")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(didTapCameraButton))
        leftBarItem.tintColor = .white
        
        navigationItem.leftBarButtonItem = leftBarItem
        
//        cameraButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
//        cameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        cameraButton.setTitle("Camera", for: .normal)
//        cameraButton.reSize(size: CGSize(width: 120, height: 40))
//        cameraButton.layer.cornerRadius = 4
//        cameraButton.backgroundColor = .blue
//        _ = cameraButton.applyGradient(colours: [.blue, .white], locations: [0.0, 0.8])
        
//        cameraButton.roundCorners(.allCorners, radius: 4)
         albumView.anchor(top: photoView.bottomAnchor, leading: view.leadingAnchor,
                         bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

                
    }
    
    @objc func didTapCameraButton(){
        self.imagePicker.present(from: self.view)
    }

    
    fileprivate func requestPhoto() {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        PHPhotoLibrary.shared().register(self)
                        self.loadPhotos()
                    }
                    break
                case .notDetermined:
                    break
                default:
                    break
            }
        }
    }
    
    fileprivate func loadPhotos() {
        let options = PHFetchOptions()
        options.wantsIncrementalChangeDetails = false
        options.sortDescriptors = [ NSSortDescriptor(key: "creationDate", ascending: false) ]
        let result = PHAsset.fetchAssets(with: .image, options: options)
        if let firstAsset = result.firstObject {
            loadImageFor(firstAsset)
        }
        
        if let controller = albumController {
            controller.update(dataSource: result)
        } else {
            let albumController = AlbumPhotoViewController(dataSource: result)
            albumController.didSelectAssetHandler = { [weak self] selectedAsset in
                self?.loadImageFor(selectedAsset)
            }
            albumController.view.frame = albumView.bounds
            albumView.addSubview(albumController.view)
            addChild(albumController)
            albumController.didMove(toParent: self)
            self.albumController = albumController
        }
    }
    
    fileprivate func loadImageFor(_ asset: PHAsset) {
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isSynchronous = true
        let targetSize = CGSize(width: asset.pixelWidth, height: asset.pixelHeight)
        PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: .default, options: options) { (image, _) in
            DispatchQueue.main.async {
                self.scrollView.image = image
            }
        }
        selectedAsset = asset
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func nextButtonTapped(_ sender: Any) {
//        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        guard let editorController = mainStoryBoard.instantiateViewController(withIdentifier: "PhotoEditorViewController") as? PhotoEditorViewController else {
//            return
//        }
//        editorController.croppedImage = scrollView.croppedImage
//        
//        navigationController?.pushViewController(editorController, animated: false)
    }
    
}

extension PhotoListController: PHPhotoLibraryChangeObserver {
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        self.loadPhotos()
    }
}

extension PhotoListController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        //self.imageView.image = image
    }
}
