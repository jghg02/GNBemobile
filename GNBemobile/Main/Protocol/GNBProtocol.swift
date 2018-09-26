//
//  GNBProtocol.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 22/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

import JCore_ui

protocol GNBProtocol: NSObjectProtocol {

    func startLoading() -> JCoreLoaderView
    func finishLoading(loading: JCoreLoaderView)
    func configViewWithData(data: [GNBTransaction])
}
