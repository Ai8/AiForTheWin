//
//  ViewController.m
//  AiForTheWin
//
//  Created by Matt Houston on 7/2/15.
//  Copyright (c) 2015 AiForTheWin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    NSString *doYouLikeString;
    NSArray *speechVoices;
    NSString *stringAnimal;
    NSMutableArray *animals;
}
@end

@implementation ViewController

@synthesize machineVoice, positveVerbs, negativeVerbs, arrayOfAnimals, synthesizer, nouns, personVoice;

#pragma View Controller Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //load the brain
    [self setUpArrays];
    
    synthesizer = [[AVSpeechSynthesizer alloc] init];
    
    robotSpeak = [NSTimer scheduledTimerWithTimeInterval:(1) target:self selector:@selector(robotStartThinking) userInfo:Nil repeats:YES];
    
    //set intitial text to begin conversation
    machineVoice.text = @"Hi, my name is Robee and I will be assisting you today. How are you feeling?";
    [self speakNow];
    
}

-(void)viewDidAppear:(BOOL)animated {
}


#pragma mark UITextFieldDelegates + Control UITextField
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return nil;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    return nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [personVoice resignFirstResponder];
    
    [self setUpArrays];
    [self robotStartThinking];
}

#pragma mark Robot methods
-(void)speakNow {
    utterance = [[AVSpeechUtterance alloc] initWithString: machineVoice.text];
    
    utterance.rate = 0.14;
    utterance.pitchMultiplier = 1.0;
    utterance.volume = 0.75;
    speechVoices = [AVSpeechSynthesisVoice speechVoices];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-au"];
    [synthesizer speakUtterance:utterance];
    [self performSelector:@selector(speakStop) withObject:nil afterDelay:1.5];
}


-(void)speakStop {
    utterance.volume = 0.0;
}

-(void)robotStartThinking {
    
    NSMutableArray *doYouLikeArray = [[NSMutableArray alloc]initWithObjects:@"do you like to play baseball?",@"do you like to play basketball?",@"do you like sharks?",@"do you like fish?", nil];
    
    NSLog(@"%@", speechVoices);
    
    for (int i = 0; i < [doYouLikeArray count]; i++) {
        NSString *doYouLike = [doYouLikeArray objectAtIndex:i];
        doYouLikeString = @"do you like";
        
    }
    
    if ([personVoice.text containsString:doYouLikeString] && !personVoice.isEditing) {
        
        NSString *string1 = [personVoice.text substringWithRange:NSMakeRange(0, 11)];
        NSString *string2 = [personVoice.text substringWithRange:NSMakeRange(11, [personVoice.text length]-[string1 length])];
        
        NSLog(@"string 1 = %@ string 2 = %@",string1,string2);
        
        machineVoice.text = [NSString stringWithFormat:@"Yes, I love %@", string2];
        [self speakNow];
        [robotSpeak invalidate];
        
    }
    
}


#pragma mark Brain Arrays
-(void)animals {

    NSMutableArray *animalResponses = [[NSMutableArray alloc]initWithObjects:@"%@ are cool",@"I really like %@ ",@"%@ are the best animals",@"%@ are one of the coolest animals ever", nil];
    
    for (int i = 0; i < [arrayOfAnimals count]; i++) {
        NSString *animalString = [arrayOfAnimals objectAtIndex:i];
        
        for (int i = 0; i < [animalResponses count]; i++) {
            stringAnimal = [animalResponses objectAtIndex:i];
        }
        
        if ([personVoice.text containsString:animalString]) {
            machineVoice.text = [NSString stringWithFormat:stringAnimal, animalString];
            [self speakNow];
        }
    }
}

-(void)setUpArrays {
    arrayOfAnimals = [[NSMutableArray alloc]initWithObjects:@"dogs",@"cats",@"fish",@"rats",@"mouses",@"jelly fish",@"ferits",@"crabs",@"hamsters",@"spiders", @"turtles",@"snakes",@"slugs",@"worms",@"ants",@"whales",@"zebras",@"toads",@"tigers",@"lions", @"leopards",@"pandas",@"sharks",@"gorillas",@"chimps",@"monkeys",@"sloths",@"elephants",@"camels",@"horses", @"giraffes",@"ostrages",@"wolves",@"rhinos",@"hippos",@"star fish",@"dinosaurs",@"limas",@"koala bears",@"bats", @"raccoons",@"butterflies",@"ladybugs",@"possums",@"bees",@"wasp cats",@"blue jays",@"pigeons",@"wood peckers",@"emus", @"frogs",@"polar bears",@"seaguls",@"blob fish",@"crocodiles",@"worms",@"turkeys",@"chickens",@"ducks",@"jaguars", @"panthers",@"coyotes",@"penguins",@"rams",@"elks",@"sheeps",@"gerbils",@"bulls",@"roosters",@"cheetahs", @"owls",@"apes",@"gooses",@"parrots",@"cobras",@"seals",@"kangaroos",@"hyenas",@"catfish",@"chipmunks", @"whales",@"alligators",@"catfish",@"antelopes",@"toads",@"lamas",@"hyenas",@"chimpanzees",@"black bears",@"brown bears", @"trouts",@"blad eagles",@"eagles",@"cougars",@"swordfish",@"poodles",@"swans",@"ravens",@"lobsters",@"dolphins", nil];
    
    nouns = [[NSMutableArray alloc] initWithObjects: @"friend", @"roommate", @"house", @"housemate", @"train", @"computer", @"drugs", @"marijuana", @"weed", @"grass", @"hospital", @"car", @"vehicle", @"bus",@"robot", @"subway", @"city", @"hospital", @"united states", @"san francisco", @"california", @"richmond", @"china", @"brain", @"kitchen", @"knife", @"dog", @"travel", @"airplane", @"television", @"movie",@"girlfriend", @"boyfriend", @"father", @"mother",  @"dad",  @"mom",  @"sister",  @"brother",  @"niece",  @"nephew",  @"uncle",  @"aunt",  @"cousin",  @"grandmother",  @"grandfather",  @"birthday",@"family",
             nil];
    
    negativeVerbs = [[NSMutableArray alloc]initWithObjects:@"kicked me", @"did kick", @"kicked him", @"kicked her",@"kicked it", @"kicked my", @"punched me", @"did punch", @"punched him", @"punched her",@"punched it", @"punched my",@"pushed me", @"did push", @"pushed him", @"push her",@"pushed it", @"pushed my",@"spat on me", @"did spit", @"spat on him", @"spat on her",@"spat on it", @"spit", @"threw up", @"threw up on him", @"threw up on her", @"threw up on",@"did not call me", @"didn't call me", @"did not call him", @"didn't call him", @"did not call her", @"didn't call her", @"did not text me", @"didn't text me", @"did not text him", @"didn't text him", @"did not text her", @"didn't text her",@"did not speak to me", @"didn't speak to me", @"did not speak to him", @"did not speak to her", @"didn't speak to her", @"did not talk to him", @"didn't talk to him", @"did not talk to her", @"didn't talk to her",@"did not talk to me", @"didn't talk to me", @"did not talk to him", @"did not talk to her", @"didn't talk to her", @"did not love him", @"didn't love him", @"did not love her", @"didn't love her",@"did not love me", @"didn't love me", @"did not love him", @"did not love her", @"didn't love her",  @"did not like him", @"didn't like him", @"did not like her", @"didn't like her",@"did not like me", @"didn't like me", @"did not like him", @"did not like her", @"didn't like her", @"did not look at him", @"didn't look at him", @"did not look at her", @"didn't look at her",@"did not look at me", @"didn't look at me", @"did not look at him", @"did not look at her", @"didn't look at her", @"did not respect him", @"didn't respect him", @"did not respect her", @"didn't respect her",@"did not respect me", @"didn't respect me", @"did not respect him", @"did not respect her", @"didn't respect her", @"did not praise him", @"didn't praise him", @"did not praise her", @"didn't praise her",@"did not praise me", @"didn't praise me", @"did not praise him", @"did not praise her", @"didn't praise her",  @"did not see him", @"didn't see him", @"did not see her", @"didn't see her",@"did not see me", @"didn't see me", @"did not see him", @"did not see her", @"didn't see her",@"didn't choose", @"did not choose", @"didn't pay", @"did not pay", @"didn't eat", @"did not eat", @"did not have sex", @"didn't have sex", @"did not have sex with him", @"didn't have sex with her",@"did not order", @"didn't order", @"did not buy", @"didn't buy", @"did not purchase", @"didn't purchase", @"did not eat", @"didn't eat", @"i am not eating", @"he is not eating", @"he isn't not eating", @"she isn't eating", @"she is not eating", @"does not listen", @"doesn't listen", @"can not hear", @"can't hear", @"could not go", @"can not go", nil];
    
    top25Nouns = [[NSMutableArray alloc]initWithObjects:@"time",@"person",@"year",@"way",@"day",@"thing",@"man",@"world",@"life",@"hand",@"part",@"child",@"eye",@"woman",@"place",@"work",@"week",@"case",@"point",@"governemnt",@"company",@"number",@"group",@"problem",@"fact", nil];
    
    top25Adverbs = [[NSMutableArray alloc]initWithObjects:@"up",@"so",@"out",@"just",@"now",@"how",@"then",@"more",@"also",@"here",@"well",@"only",@"very",@"even",@"back",@"there",@"down",@"still",@"in",@"as",@"too",@"when",@"never",@"really",@"most", nil];
    
    top25Adjectives = [[NSMutableArray alloc]initWithObjects:@"good",@"new",@"first",@"last",@"long",@"great",@"little",@"own",@"other",@"old",@"right",@"big",@"high",@"different",@"small",@"large",@"next",@"early",@"young",@"important",@"few",@"public",@"bad",@"same",@"able", nil];
    
    top25Pronouns = [[NSMutableArray alloc]initWithObjects:@"it",@"I",@"you",@"he",@"they",@"we",@"she",@"who",@"them",@"me",@"him",@"one",@"her",@"us",@"something",@"nothing",@"anything",@"himself",@"everything",@"someone",@"themselves",@"everyone",@"itself",@"anyone",@"myself", nil];
    
    top25Conjunctions = [[NSMutableArray alloc]initWithObjects:@"and",@"that",@"but",@"or",@"as",@"if",@"when",@"than",@"because",@"while",@"where",@"after",@"so",@"though",@"since",@"until",@"whether",@"before",@"although",@"nor",@"like",@"once",@"unless",@"now",@"except", nil];
    
    top25Verbs = [[NSMutableArray alloc]initWithObjects:@"be",@"have",@"do",@"say",@"get",@"make",@"go",@"know",@"take",@"see",@"come",@"think",@"look",@"want",@"give",@"use",@"find",@"tell",@"ask",@"work",@"seem",@"feel",@"try",@"leave",@"call", nil];
    
    top25Prepositions = [[NSMutableArray alloc]initWithObjects:@"of",@"in",@"to",@"for",@"with",@"on",@"at",@"from",@"by",@"about",@"as",@"into",@"like",@"through",@"after",@"over",@"between",@"out",@"against",@"during",@"without",@"before",@"under",@"around",@"among", nil];
    
    top10Interjections = [[NSMutableArray alloc]initWithObjects:@"yes",@"oh",@"yeah",@"no",@"hey",@"hi",@"hello",@"hmm",@"ah",@"wow", nil];
    
    top25numbers = [[NSMutableArray alloc]initWithObjects:@"one",@"two",@"first",@"last",@"three",@"next",@"million",@"four",@"five",@"second",@"six",@"third",@"billion",@"hundred",@"thousand",@"seven",@"eight",@"ten",@"nine",@"dozen",@"fourth",@"twenty",@"fifth",@"thirty",nil];
    
    top100WordsMostCommonly = [[NSMutableArray alloc]initWithObjects:@"the",@"be",@"to",@"of",@"and",@"a",@"in",@"that",@"have",@"I",@"it",@"for",@"not",@"on",@"with",@"he",@"as",@"you",@"do",@"at",@"you",@"do",@"at",@"this",@"but",@"his",@"by",@"from",@"they",@"we",@"say",@"her",@"she",@"or",@"an",@"will",@"my",@"one",@"all",@"would",@"there",@"their",@"what",@"so",@"up",@"out",@"if",@"about",@"who",@"get",@"which",@"go",@"me",@"when",@"make",@"can",@"like",@"time",@"no",@"just",@"him",@"know",@"take",@"person",@"into",@"year",@"your",@"good",@"some",@"could",@"them",@"see",@"other",@"than",@"then",@"now",@"look",@"only",@"come",@"its",@"over",@"think",@"also",@"back",@"after",@"use",@"two",@"how",@"our",@"work",@"first",@"well",@"way",@"even",@"new",@"want",@"because",@"any",@"these",@"give",@"day",@"most",@"us", nil];
    
    //Array of synonyms for love
    loveSynonyms = [[NSMutableArray alloc]initWithObjects:@"affection",@"appreciation",@"devotion",@"emotion",@"fondness",@"friendship",@"infatuation",@"lust",@"passion",@"respect",@"taste",@"tenderness",@"yearning",@"adulation",@"allegiance",@"amity",@"amorousness",@"amour",@"ardor",@"attachment",@"case",@"cherishing",@"crush",@"delight",@"devotedness",@"enchantment",@"enjoyment",@"fernor",@"fidelity",@"flame", nil];
    
    responsesForTextContainingWordLove = [[NSMutableArray alloc]initWithObjects:@"love is a very strong word",@"do you even know the meaning of the word love?",@"I'm glad you feel that way",nil];
    
    NSMutableArray *personFeelings = [[NSMutableArray alloc]initWithObjects:@"great",@"not so good",@"fine!",@"fantastic!",@"horrible",@"good",@"terrific",@"bad", nil];
    
    allwords = [NSMutableArray array];
    [allwords addObjectsFromArray:top25numbers];
    [allwords addObjectsFromArray:top25Nouns];
    [allwords addObjectsFromArray:top25Adjectives];
    [allwords addObjectsFromArray:top25Adverbs];
    [allwords addObjectsFromArray:top25Conjunctions];
    [allwords addObjectsFromArray:top25Prepositions];
    [allwords addObjectsFromArray:top25Pronouns];
    [allwords addObjectsFromArray:top25Verbs];
    [allwords addObjectsFromArray:top100WordsMostCommonly];
    [allwords addObjectsFromArray:top10Interjections];
    [allwords addObjectsFromArray:negativeVerbs];
    [allwords addObjectsFromArray:nouns];
    [allwords addObjectsFromArray:animals];
}


@end
