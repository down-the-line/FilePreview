//
//  PDFPreviewView.swift
//  NoahUser
//
//  Created by Hardeep Singh on 27/04/20.
//  Copyright © 2020 Hardeep. All rights reserved.
//

import Foundation
import PDFKit

class PDFPreviewView: PDFView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(previewItem: PreviewItem) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.document = PDFDocument(url: previewItem.url)
    }
    
}
