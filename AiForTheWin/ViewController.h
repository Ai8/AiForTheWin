//
//  ViewController.h
//  AiForTheWin
//
//  Created by Matt Houston on 7/2/15.
//  Copyright (c) 2015 AiForTheWin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UITextFieldDelegate, AVSpeechSynthesizerDelegate> {
    
    //timers
    NSTimer *robotSpeak;
    
    
    //strings
    NSString *pwords;
    NSString *zwords;
    NSString *nwords;
    NSString *panwords;
    
    
    //speech
    AVSpeechUtterance *utterance;
    
    //Arrays of words
    NSMutableArray *top25Adverbs;
    NSMutableArray *top25Nouns;
    NSMutableArray *top25Adjectives;
    NSMutableArray *top25Pronouns;
    NSMutableArray *top25Conjunctions;
    NSMutableArray *top25Verbs;
    NSMutableArray *top25Prepositions;
    NSMutableArray *top10Interjections;
    NSMutableArray *top100WordsMostCommonly;
    NSMutableArray *top25numbers;
    NSMutableArray *responsesForTextContainingWordLove;
    NSMutableArray *allwords;
    NSMutableArray *icebreaker;
    NSMutableArray *loveSynonyms;
    
}

//IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *machineVoice;
@property (weak, nonatomic) IBOutlet UITextField *personVoice;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

//Array of words
@property(strong,nonatomic) NSMutableArray *arrayOfAnimals;
@property (strong, nonatomic) NSMutableArray *nouns;
@property (strong, nonatomic) NSMutableArray *positveVerbs;
@property (strong, nonatomic) NSMutableArray *negativeVerbs;



//Speech synthesizer
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property(nonatomic, retain) AVSpeechSynthesisVoice *voice;


@end

