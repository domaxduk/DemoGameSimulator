//
//  ViewController.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import UIKit

class ViewController: UIViewController {
    private var selectFileController: SelectFileController?


    // MARK: - Action
    @IBAction func importFileButtonDid(_ sender: Any) {
        let controller = SelectFileController()
        controller.delegate = self
        controller.present(self)
        self.selectFileController = controller
    }
}

// MARK: - SelectFileControllerDelegate
extension ViewController: SelectFileControllerDelegate {
    func selectFileController(_ controller: SelectFileController, didSelectFile url: URL) {
        
    }
}

