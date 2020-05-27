//
//  FilePreviewViewController.swift
//  Hardeep
//
//  Created by Hardeep Singh on 27/04/20.
//  Copyright © 2020 Hardeep. All rights reserved.
//

import UIKit
import PDFKit

//protocol FileCached {
//    var isExistLocalPath: Bool {get}
//    var url: URL {get}
//}
//
//extension FileCached {
//    var isExistLocalPath: Bool {
//        return FileManager().fileExists(atPath: self.url.path)
//    }
//}

protocol PreviewItem {
    var url: URL {get}
    var titel: String {get}
}

extension PreviewItem {
    var isPDF: Bool {
        return url.pathExtension == "pdf"
    }
}


class FilePreviewViewController: UIViewController {
   
    private(set) var previewItem: PreviewItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barButton = UIBarButtonItem(image: UIImage(named: "arrowleft"), style: .plain, target: self, action: #selector(menuButtonClicked))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func menuButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func initController(previewItem: PreviewItem) -> FilePreviewViewController {
        let controller = FilePreviewViewController(nibName: "FilePreviewViewController", bundle: nil)
        controller.previewItem = previewItem
        return controller
    }
    
    var preivewView: UIView!
    func preview() {
        
        if previewItem.isPDF {
            preivewView  = PDFPreviewView(previewItem: previewItem)
        } else {
            preivewView = ImagePreviewView(previewItem: previewItem)
        }
        
        preivewView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(preivewView)
        preivewView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        preivewView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        preivewView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        preivewView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
}
