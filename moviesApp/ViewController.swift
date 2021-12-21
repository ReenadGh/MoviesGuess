//
//  ViewController.swift
//  moviesApp
//
//  Created by Reenad gh on 15/05/1443 AH.
//

import UIKit

class ViewController: UIViewController  ,
                      UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionView: UICollectionView!

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
        
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectiomCell
        cell.movieNamelbl.text = movies[indexPath.item]["title"]! as? String
        cell.movieImage.image =  UIImage(named: movies[indexPath.item]["ImageName"]! as! String)

        return cell
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
   
        if cell!.layer.borderColor == UIColor.systemBlue.cgColor{
                  cell!.layer.borderColor = UIColor.clear.cgColor
                  cell!.layer.borderWidth = 3
            
            indexOfMoviesToQuiz.remove(at: indexOfMoviesToQuiz.index(of: indexPath.item )!)
    
                  
              }else{
                  cell!.layer.borderColor = UIColor.systemBlue.cgColor
                  cell!.layer.borderWidth = 3
                  indexOfMoviesToQuiz.append(indexPath.item)
              }




  
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.499 , height: self.view.frame.width * 0.45)
    }
    //between tow line
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

      
        // Do any additional setup after loading the view.
    }


}

