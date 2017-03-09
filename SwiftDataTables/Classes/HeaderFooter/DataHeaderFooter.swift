//
//  DataHeaderFooter.swift
//  SwiftDataTables
//
//  Created by Pavan Kataria on 22/02/2017.
//  Copyright © 2017 Pavan Kataria. All rights reserved.
//

import UIKit

class DataHeaderFooter: UICollectionReusableView {

    //MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sortingImageView: UIImageView!

    //MARK: - Events
    var didTapEvent: (() -> Void)? = nil

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(DataHeaderFooter.didTapView))
        self.addGestureRecognizer(tapGesture)
    }
    
    func setup(viewModel: DataHeaderFooterViewModel) {
        self.titleLabel.text = viewModel.data
        self.sortingImageView.image = UIImage(named: viewModel.imageForSortingElement ?? "")
        
//        viewModel.modelUpdated = { [weak self] viewModel in
//            self?.update(viewModel: viewModel)
//        }
    }
    
//    public func update(viewModel: DataHeaderFooterViewModel){
//        self.sortingImageView.image = UIImage(named: viewModel.imageForSortingElement ?? "")
//    }
    
    @objc func didTapView(){
        self.didTapEvent?()
    }
}
