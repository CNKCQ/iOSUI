//
//  ViewController.swift
//  IMGFilter
//
//  Created by KingCQ on 2017/1/7.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var imageView: UIImageView!
    var collectionView: UICollectionView!
    fileprivate let context = CIContext(options: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: view.bounds.width, height: view.bounds.height * 0.75)))
        view.addSubview(imageView)
        imageView.image = UIImage(named: "img.jpg")
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 180)
        let frame = CGRect(origin: CGPoint(x: 0,y: imageView.frame.maxY + 10), size: CGSize(width: UIScreen.main.bounds.width, height: 180))
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }
    
    func image(image: UIImage = UIImage(), type: FilterType = .normal) -> UIImage {
        // 1 - create source image
        let sourceImage = CIImage(image: image)
        
        // 2 - create filter using name
        let filter = CIFilter(name: type.rawValue)
        filter?.setDefaults()
        
        // 3 - set source image
        filter?.setValue(sourceImage, forKey: kCIInputImageKey)
        
        // 4 - output filtered image as cgImage with dimension.
        guard let outputImage = filter?.outputImage, let extent = filter?.outputImage?.extent else {
            return image
        }
        let outputCGImage = context.createCGImage(outputImage, from: extent)
        
        // 5 - convert filtered CGImage to UIImage
        let filteredImage = UIImage(cgImage: outputCGImage!)
        return filteredImage
    }
   
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterDisplayNameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.titleLabel.textColor = .white
        cell.titleLabel.text = filterDisplayNameList[indexPath.item].title
        cell.imageView.image = image(image: UIImage(named: "img.jpg")!, type: filterDisplayNameList[indexPath.item].type)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CustomCell
        imageView.image = cell?.imageView.image
    }
}

enum FilterType: String {
    case normal = "No Filter"
    case chrome = "CIPhotoEffectChrome"
    case fade = "CIPhotoEffectFade"
    case instant = "CIPhotoEffectInstant"
    case mono = "CIPhotoEffectMono"
    case noir = "CIPhotoEffectNoir"
    case process = "CIPhotoEffectProcess"
    case tonal = "CIPhotoEffectTonal"
    case transfer = "CIPhotoEffectTransfer"
    case tone = "CILinearToSRGBToneCurve"
    case linear = "CISRGBToneCurveToLinear"
}


fileprivate let filterDisplayNameList: [(title: String, type: FilterType)] = [
    ("Normal", .normal),
    ("Chrome", .chrome),
    ("Fade", .fade),
    ("Instant", .instant),
    ("Mono", .mono),
    ("Noir", .noir),
    ("Process", .process),
    ("Tonal", .tonal),
    ("Transfer", .transfer),
    ("Tone", .tone),
    ("Linear", .linear),
]

class CustomCell: UICollectionViewCell {
    var titleLabel: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel = UILabel()
        imageView = UIImageView()
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: contentView.bounds.width, height: 35))
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: titleLabel.frame.maxY ), size: CGSize(width: contentView.bounds.width, height: contentView.bounds.height - 35))
    }
}



