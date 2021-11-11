//
//  ViewController.swift
//  YouCube
//
//  Created by Andrei Korikov on 11.11.2021.
//

import UIKit

class HomeController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        collectionView.backgroundColor = .white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)

        return cell
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

class VideoCell: UICollectionViewCell {
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-16-[v0]-16-|",
            options: [],
            metrics: nil,
            views: ["v0": thumbnailImageView]))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|[v0]|",
            options: [],
            metrics: nil,
            views: ["v0": separatorView]))
        
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-16-[v0]-16-[v1(1)]|",
            options: [],
            metrics: nil,
            views: ["v0": thumbnailImageView, "v1": separatorView]))
    }
}

