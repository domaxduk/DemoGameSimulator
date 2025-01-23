//
//  SelectFileController.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation
import UIKit
import UniformTypeIdentifiers

protocol SelectFileControllerDelegate: AnyObject {
    func selectFileController(_ controller: SelectFileController, didSelectFile url: URL)
}

class SelectFileController: NSObject {
    weak var delegate: SelectFileControllerDelegate?
    var pickerVC: UIDocumentPickerViewController?
    
    func present(_ vc: UIViewController) {
        let supportedTypes = GameType.allCases.compactMap { UTType(filenameExtension: $0.rawValue) }
        let pickerVC = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        pickerVC.delegate = self
        pickerVC.allowsMultipleSelection = false
        vc.present(pickerVC, animated: true)
        self.pickerVC = pickerVC
    }
}

// MARK: - UIDocumentBrowserViewControllerDelegate
extension SelectFileController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let firstItem = urls.first {
            self.delegate?.selectFileController(self, didSelectFile: firstItem)
        }
    }
}
