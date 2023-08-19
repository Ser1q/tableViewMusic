//
//  ViewController.swift
//  tableViewClassicalMusic
//
//  Created by Nuradil Serik on 19.08.2023.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelAuthor: UILabel!
    
    @IBAction func playButton(_ sender: UIButton) {
        playSound()
    }
    
    var player: AVAudioPlayer!
    
    func playSound() {
        
        let url = Bundle.main.url(forResource: music.imageName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
        
    }
    
    var music = Music()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = music.name
        labelAuthor.text = music.author
        imageView.image = UIImage(named: music.imageName)
        
        
    }


}

