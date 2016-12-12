//
//  QuizViewController.m
//  MathQuiz
//
//  Created by Nirupama Prasad on 12/10/16.
//  Copyright © 2016 Nirupama Prasad. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController
//@synthesize Operand1;
int qno=1;
int r, r2;
int Ans;
int digit;
int correct=-1;
int score=0;
NSTimer *timer;
static int remainingcounts;

- (void)viewDidLoad {
    [super viewDidLoad];
    qno=1;
               dispatch_async(dispatch_get_main_queue(), ^{
    timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(countDown)
                                           userInfo:nil
                                            repeats:YES];
    remainingcounts = 5;
        NSLog(@"Value of Timer = %d",remainingcounts);
                });
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setOperators:(NSString *)O{
   //O = @"a";
    NSLog(@"Value of O:%@",O);
    self.Operand1 = [[UILabel alloc] init];
    self.Operator = [[UILabel alloc] init];
    self.Operand2 = [[UILabel alloc] init];
    self.QuesNo = [[UILabel alloc] init];
    self.TimerLabel = [[UILabel alloc] init];
   NSString *Oper=@"a";
    NSString *Oper2=@"s";
    NSString *Oper3=@"m";
    
    NSLog(@"Value of O = %@",O);
    if ([O isEqualToString:Oper]){
        
        NSLog(@"Value of O inside if = %@",O);
        dispatch_async(dispatch_get_main_queue(), ^{
            qno =1;
                r = arc4random_uniform(10);
                r2 = arc4random_uniform(10);
                correct = r+r2;
             

        [self.QuesNo setText:[NSString stringWithFormat:@"%d.",qno]];
        [self.Operator setText:[NSString stringWithFormat:@"+"]];
        [self.Operand1 setText:[NSString stringWithFormat:@"%d",r]];
        [self.Operand2 setText:[NSString stringWithFormat:@"%d",r2]];

        //    self.TimerLabel.text=[NSString stringWithFormat:@"%d", remainingcounts];
        NSLog(@"Value of Timer = %d",remainingcounts);
        });
  //      [[[NSRunLoop mainRunLoop] runUntilDate:NSdate dateWithTimeIntervalSinceNow:0.5] ];
  //      NSLog(@"Value of Operator = %@",self.Operator.text);
  //      NSLog(@"Value of Operand1 = %@",self.Operand1.text);
  //      NSLog(@"Value of Operand2 = %@",self.Operand2.text);
    }else if ([O isEqualToString:Oper2]){
         dispatch_async(dispatch_get_main_queue(), ^{
  
             r = arc4random_uniform(10);
             r2 = arc4random_uniform(10);
             if (r>r2){}
             else{
                 int temp1 =r2;
                 r2=r;
                 r=temp1;
             }
                // -[self buttonPressed: _ButtonN];
        self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
        self.Operator.text = [NSString stringWithFormat:@"-"];
        self.Operand1.text = [NSString stringWithFormat:@"%d",r];
                 self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
                 
                 // Call Action from here
                     self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
             
             
             });
    }else if ([O isEqualToString:Oper3]){
        NSLog(@"In X");
        dispatch_async(dispatch_get_main_queue(), ^{
            r = arc4random_uniform(10);
            r2 = arc4random_uniform(10);
   //         NSLog(@"Value of Operator = %@",self.Operator.text);
   //         NSLog(@"Value of Operand1 = %@",self.Operand1.text);
   //         NSLog(@"Value of Operand2 = %@",self.Operand2.text);
        self.Operator.text = [NSString stringWithFormat:@"X"];
        self.Operand1.text = [NSString stringWithFormat:@"%d",r];
        self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
        });
    }
}

-(void)countDown {
    NSLog(@"Value of Timer = %d",remainingcounts);
    [self.TimerLabel setText:[NSString stringWithFormat:@"%d",remainingcounts]];
    if (Ans == correct){
        NSLog(@"Correct");
        NSLog(@"%d",qno);
        if(qno > 10){
            /*            [self performSegueWithIdentifier:@"toScore" sender:ButtonN];*/
            [timer invalidate];
        }
        self.Answer.text = [NSString stringWithFormat:@"?"];
        remainingcounts=5;
        [self.TimerLabel setText:[NSString stringWithFormat:@"%d",remainingcounts]];
        qno++;
        r = arc4random_uniform(10);
        r2 = arc4random_uniform(10);
        
        // -[self buttonPressed: _ButtonN];
        self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
        self.Operand1.text = [NSString stringWithFormat:@"%d",r];
        self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
        correct = -2;
        Ans = -1;
        self.Answer.text = @"?";
        score++;
        NSLog(@"Score %d",score);
        NSString *message = @"Correct!";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        
        int duration = 0.1; // duration in seconds
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });


    }
        if (--remainingcounts == -1) {
        //[timer invalidate];
        qno++;
        if(qno > 10){
            [self performSegueWithIdentifier:@"toScore" sender:self];
            [timer invalidate];
        }
        self.Answer.text = [NSString stringWithFormat:@"?"];
        remainingcounts=5;
        [self.TimerLabel setText:[NSString stringWithFormat:@"%d",remainingcounts]];
        r = arc4random_uniform(10);
        r2 = arc4random_uniform(10);
        if (r>r2){}
        else{
            int temp1 =r2;
            r2=r;
            r=temp1;
        }
        // -[self buttonPressed: _ButtonN];
        self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
        self.Operand1.text = [NSString stringWithFormat:@"%d",r];
        self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
        correct = 0;
        Ans = -1;
        self.Answer.text = @"?";
    }
}
- (IBAction) buttonPressed2:(UIButton*) ButtonN{
    NSLog(@"%d",qno);
    //dispatch_async(dispatch_get_main_queue(), ^{
    
    if(ButtonN==_Next){
        remainingcounts = 5;
        if ([_Operator.text isEqualToString: @"+"]){
        NSLog(@"r = %d,r2 = %d",r,r2);
        correct = r+r2;
        NSLog(@"Ans entered is : %d",Ans);
        NSLog(@"Correct answer is : %d",correct);
        }
        else if([_Operator.text isEqualToString: @"-"]){
            NSLog(@"r = %d,r2 = %d",r,r2);
            correct = r-r2;
            NSLog(@"Ans entered is : %d",Ans);
            NSLog(@"Correct answer is : %d",correct);
        }
        else if([_Operator.text isEqualToString: @"X"]){
            NSLog(@"r = %d,r2 = %d",r,r2);
            correct = r*r2;
            NSLog(@"Ans entered is : %d",Ans);
            NSLog(@"Correct answer is : %d",correct);
        }NSString *message = @"Wrong";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        //[toast show];
        
        int duration = 1; // duration in seconds
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
        if(Ans == correct){
            NSLog(@"Correct answer");
            NSLog(@"Score %d",score);
            score++;
            NSLog(@"Score %d",score);
            NSString *message = @"Correct!";
            
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            
            int duration = 0.1; // duration in seconds
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });

    }
        else{
            NSLog(@"Wrong answer");
            NSString *message = @"Wrong";
            
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            
            int duration = 0.1; // duration in seconds
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });}
        
       // while(qno<=10){
            qno++;
            if(qno >= 11){
                [self performSegueWithIdentifier:@"toScore" sender:ButtonN];
            }
            self.Answer.text = [NSString stringWithFormat:@"?"];
            r = arc4random_uniform(10);
            r2 = arc4random_uniform(10);
            if (r>r2){}
            else{
                int temp1 =r2;
                r2=r;
                r=temp1;
            }
            // -[self buttonPressed: _ButtonN];
            self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
            self.Operand1.text = [NSString stringWithFormat:@"%d",r];
            self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
        correct = 0;
        Ans = -1;
        self.Answer.text = @"?";
 //       }
        
        
    }else if(ButtonN==_Numpad1){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 1;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 1;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
        
    }else if(ButtonN==_Numpad2){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 2;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 2;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==_Numpad3){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 3;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 3;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==_Numpad4){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 4;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 4;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==_Numpad5){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 5;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 5;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==_Numpad6){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 6;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 6;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==_Numpad7){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 7;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 7;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==_Numpad8){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 8;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 8;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==_Numpad9){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 9;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 9;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==_Numpad0){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 0;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }
    //});
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender{
    if([segue.identifier isEqualToString:@"toScore"]){
        ResultsViewController *controller = (ResultsViewController *) segue.destinationViewController;
        [controller setScore:(int *)score];
      //  NSLog(@"Value of PassOpp = %@",Score);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
