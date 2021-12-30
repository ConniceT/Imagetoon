//
//  VideoController.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import UIKit
import Photos

class VideoController: UIViewController {

    var photoView = UIView()
    var albumView =  UIView()
    fileprivate var selectedAsset: PHAsset?
    var cameraButton : UIButton!
    var photoGalleryButton : UIButton!
    var videoPicker: VideoPicker!
    var rightBarItem : UIBarButtonItem!
    
    fileprivate var albumController: AlbumVideoController?
    
    override func viewDidLoad() {
        super.viewDidLoad()  
        setUpView()
        requestPhoto()
    }
    
    private func setUpView() {
        let leftBarItem = UIBarButtonItem(image: UIImage(systemName: "camera")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(didTapCameraButton))
        leftBarItem.tintColor = .white
        
        navigationItem.leftBarButtonItem = leftBarItem
        
        rightBarItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(didTapCameraButton))
        rightBarItem.tintColor = .white
        
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
        
        videoPicker = VideoPicker(presentationController: self, delegate: self)

    }
    
    private func setupScrollView() {
        

        
        
        view.addSubviews(albumView)
        
        photoView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, 
                         bottom: nil, trailing: view.trailingAnchor)
        photoView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.4).isActive = true
        
        let leftBarItem = UIBarButtonItem(image: UIImage(systemName: "camera")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(didTapCameraButton))
        leftBarItem.tintColor = .white
        
        navigationItem.rightBarButtonItem = leftBarItem
        
        albumView.anchor(top: photoView.bottomAnchor, leading: view.leadingAnchor,
                         bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        
        
    }
    
    @objc func didTapCameraButton(){
        self.videoPicker.present(from: self.view)
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
        let result = PHAsset.fetchAssets(with: .video, options: options)

        print("Video result is \(result)")
        if let controller = albumController {
            controller.update(dataSource: result)
        } else {
            let albumController = AlbumVideoController(dataSource: result)
            albumController.didSelectAssetHandler = { [weak self] selectedAsset in
                //self?.loadImageFor(selectedAsset)
            }
            albumController.view.frame = view.bounds
            view.addSubview(albumController.view)
            addChild(albumController)
            albumController.didMove(toParent: self)
            self.albumController = albumController
        }
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

extension VideoController: PHPhotoLibraryChangeObserver {
    
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        self.loadPhotos()
    }
}

extension VideoController: VideoPickerDelegate {
    func didSelect(url: URL?) {
        
    }
    
}
