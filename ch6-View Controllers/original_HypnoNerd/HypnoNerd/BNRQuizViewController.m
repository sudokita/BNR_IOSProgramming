//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by sudokita on 3/19/14.
//  Copyright (c) 2014 com.sudokita. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions; //ordered lists containing questions
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic,weak) IBOutlet UILabel *questionLabel;
@property (nonatomic,weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        //create two arrays filled with questions and answers and make pointers to them
        
        self.questions = @[@"From what is cognac made?", @"What is 7+7?", @"What is the capital of Vermont?"];
    
        self.answers = @[@"Grapes", @"14", @"Montpelier"];
        
        //set tab bar item's title
        self.tabBarItem.title = @"Quiz";
    }
    
    //return address of the new object
    return self;
}


- (IBAction)showQuestion:(id)sender
{
    //step to next question
    self.currentQuestionIndex++;
    
    //am i past the last question?
    if (self.currentQuestionIndex == [self.questions count])
    {
        //back to first
        self.currentQuestionIndex=0;
    }
    
    //get the string at that index in the q array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    //display string in q labale
    self.questionLabel.text = question;
    
    //reset answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    //what is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //display answer in a label
    self.answerLabel.text = answer;
}

@end
