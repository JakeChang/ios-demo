//
//  CollectionViewController2.swift
//  iOS-demo
//
//  Created by Jake Chang on 2023/3/29.
//

import UIKit

class CollectionViewController2: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //
    var array: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = TagCollectionViewFlowLayout()
        
        array = ["aa", "bbbbbbbbbbbb", "ccc", "dddd", "eeeeeeeeeeeeeee", "ffffff", "ee", "gggggggggg"]
    }
}

extension CollectionViewController2: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let title = array[indexPath.row]
        
        let font = UIFont.systemFont(ofSize: 17)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (title as NSString).size(withAttributes: attributes)
        
        let width = ceilf(Float(size.width)) + 40
        return CGSize(width: CGFloat(width), height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as! CollectionViewCell2
        cell.titleLabel.text = array[indexPath.row]
        
        return cell
    }
}

class TagCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        self.minimumInteritemSpacing = 12
        self.minimumLineSpacing = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            
            layoutAttribute.frame.origin.x = leftMargin
            
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        
        return attributes
    }
}
