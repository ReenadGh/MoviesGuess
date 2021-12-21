//
//  QuizViewController.swift
//  moviesApp
//
//  Created by Reenad gh on 16/05/1443 AH.
//

import UIKit

class QuizViewController: UIViewController {
    
    var cureentMovieindex = Int.random(in: 0 ... indexOfMoviesToQuiz.count-1)
   var score = 0
    @IBOutlet weak var movieimg: UIImageView!
    @IBOutlet weak var scorelbl: UILabel!
    @IBOutlet weak var answerTF: UITextField!
    @IBOutlet weak var hintlbl: UILabel!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func guessThemovie(_ sender: Any) {

        movieimg.isHidden = false
        nextButton.isHidden = false
        movieimg.image = UIImage(named: movies[indexOfMoviesToQuiz[cureentMovieindex]]["ImageName"]! as! String)
        let  currentMovieName =  movies[indexOfMoviesToQuiz[cureentMovieindex]]["title"] as! String
        
        guard let userGuess = answerTF else {return}
          
        if userGuess.text?.lowercased() == currentMovieName.lowercased(){
            score += 1
            
        }
        
        scorelbl.text = "Score : \(score)"

        
    }
    
    @IBAction func GoToNextQu(_ sender: Any) {
        
        movieimg.isHidden = true
        nextButton.isHidden = true
        cureentMovieindex = Int.random(in: 0 ... indexOfMoviesToQuiz.count-1)
        hintlbl.text = movies[indexOfMoviesToQuiz[cureentMovieindex]]["plot"] as! String

        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(indexOfMoviesToQuiz)
        if !(indexOfMoviesToQuiz.isEmpty){
            hintlbl.text = movies[indexOfMoviesToQuiz[cureentMovieindex]]["plot"] as! String
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
