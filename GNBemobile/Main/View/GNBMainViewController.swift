//
//  GNBMainViewController.swift
//  GNBemobile
//
//  Created by Josue Hernandez Gonzalez on 22/09/2018.
//  Copyright © 2018 Josue Hernandez Gonzalez. All rights reserved.
//

import UIKit

import JCore_ui

class GNBMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let gnbPresenter = GNBPresenter(gnbServices: GNBServices())
    var refreshControll = UIRefreshControl()
    var transactionData = [GNBTransaction]()
    var leftBarButton: GNBBadgedBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        
        gnbPresenter.attachView(view: self)
        gnbPresenter.getRates()
        gnbPresenter.getTransactions()
        
        self.tableView.refreshControl = refreshControll
        self.refreshControll.addTarget(self, action: #selector(self.initPullRefresh(_:)), for: .valueChanged)
    }

    
    func configUI() {
        self.title = "GNB Transactions"
        self.tableView.register(UINib(nibName: "GNBCell", bundle: nil), forCellReuseIdentifier: "GNBCell")
        self.setUpLeftBarButton()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GNBCell") as! GNBCell
        
        cell.displayData(data: self.transactionData[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gnbPresenter.processAction(navigation: self.navigationController!, selected: transactionData[indexPath.row], allTransaction: self.transactionData)
    }

    func setUpLeftBarButton() {
        
        let image = UIImage(named: "TransactionIcon")
        let button = UIButton(type: .custom)
        if let knownImage = image {
            button.frame = CGRect(x: 0.0, y: 0.0, width: knownImage.size.width, height: knownImage.size.height)
        } else {
            button.frame = CGRect.zero;
        }

        button.setBackgroundImage(image, for: UIControlState())

        let newBarButton = GNBBadgedBarButtonItem(customView: button, value: "5")
        leftBarButton = newBarButton
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func initPullRefresh(_ refresh: UIRefreshControl) {
        
        let delayTime = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.tableView.reloadData()
            refresh.endRefreshing()
        }
    }
    
}


extension GNBMainViewController: GNBProtocol {
    
    func startLoading() -> JCoreLoaderView {
        let image: UIImage? = JCoreBlurEffect.takeSnapOfView(view: (UIApplication.shared.keyWindow?.subviews.first)!)
        return JCoreLoaderView.createJloader(self.view, hideNavitagionBar: true, cancellable: true, withBlur: true, image: image)
    }
    
    func finishLoading(loading: JCoreLoaderView) {
        loading.removeLoader()
    }
    
    func configViewWithData(data: [GNBTransaction]) {
        transactionData = data
        leftBarButton?.badgeValue = "\(data.count)"
        tableView.reloadData()
    }
}
