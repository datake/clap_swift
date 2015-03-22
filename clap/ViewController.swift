//
//  ViewController.swift
//  clap
//
//  Created by TakedaHajime on 2015/03/23.
//  Copyright (c) 2015年 TakedaHajime. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIPickerViewDelegate,AVAudioPlayerDelegate {
    @IBOutlet var clapPickerView:UIPickerView!
    var audioPlayer : AVAudioPlayer!
    var soundCount:Int=0

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("viewdidload")
        // Do any additional setup after loading the view, typically from a nib.
        
        //再生する音源のURLを作成
        let soundFilePath :NSString=NSBundle.mainBundle().pathForResource("clap", ofType: "mp3")!
        let fileURL:NSURL=NSURL(fileURLWithPath: soundFilePath)!
        
        //AVAudioPlayerのインスタンス化
        audioPlayer=AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //pickerViewの設定
    //StoryboardのpickerView選んでdataSourceとdelegateの関連付け忘れずに！
    //いくつカテゴリーをもつか
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return 1
    }
    
    //いくつ選択肢をとるか
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    //選択肢に何を表示していくか
    func pickerView(pickerView:UIPickerView!,titleForRow row:Int,forComponent component:Int)->String!{
        return "\(row+1)回"
    }
    func pickerView(pickerView:UIPickerView,didSelectRow row :Int,inComponent component:Int){
        soundCount=row
    }
    
    //clapボタンが押されたときの処理
    @IBAction func playButton(){
        NSLog("playButton")
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }
    


}

