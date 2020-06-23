//
//  MenuViewController.swift
//  SwiftRadio
//
//  Created by Muhammad Imran on 23/06/2020.
//  Copyright © 2020 matthewfecher.com. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{

    let array : [String] = ["Sleep", "Rate" , "Privacy","more"]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationItem.title = "Menu"
        // Do any additional setup after loading the view.
    }

}


extension MenuViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menucell", for: indexPath) as! MenuCollectionViewCell
        cell.cellimage.image = UIImage(named: array[indexPath.row])
        cell.layer.cornerRadius = 10
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.row == 0 {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SleepTimeViewController") as! SleepTimeViewController

        navigationController?.pushViewController(newViewController, animated: true)
        }
        if indexPath.row == 1 {
           guard let url = URL(string: "https://github.com/imranrasheeddeveloper/SwiftRadioPro") else { return }
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }

        if indexPath.row == 2 {
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let newViewController = storyBoard.instantiateViewController(withIdentifier: "PrivacyPolicy")
             navigationController?.pushViewController(newViewController, animated: true)
        }

        if indexPath.row == 3 {
         guard let url = URL(string: "https://github.com/imranrasheeddeveloper/SwiftRadioPro") else { return }
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }


    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 2

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    
    
    
    
    
    
    
}
