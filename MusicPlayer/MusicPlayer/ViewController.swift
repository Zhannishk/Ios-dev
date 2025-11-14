//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Zhaniya Utemuratova on 03.11.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaySong(song: 0)
        player?.stop()
    }
    
    let musics = ["Anlasana", "The Last Waltz", "Criminal", "Medieval", "The Less I Know The Better"]
    let artists = ["Nahide Babashli", "Cho Young-Wuk", "Britney Spears", "FINNEAS", "Tame Impala"]
    
    var constant = 0
    var range: Int {
        return musics.count
    }
    
    @IBOutlet weak var songCover: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songArtits: UILabel!
    
    @IBAction func play(_ sender: UIButton) {
        guard let player = player else { return }

        if player.isPlaying {
            player.pause()
        } else {
            player.play()
        }
    }
    
    @IBAction func prev(_ sender: UIButton) {
        constant -= 1
        if constant < 0 {
            constant = range - 1
        }
        displaySong(song: constant)
    }
    
    @IBAction func next(_ sender: UIButton) {
        constant += 1
        if constant >= range {
            constant = 0
        }
        displaySong(song: constant)
    }
    
    
    func playSound(name: String){
        guard let url = Bundle.main.url(forResource: name, withExtension: "m4a") else {
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    func displaySong(song: Int){
        songName.text = musics[constant]
        songArtits.text = artists[constant]
        songCover.image = UIImage(named: "\(constant+1)")
        playSound(name: musics[constant])
    }

    
    
}

