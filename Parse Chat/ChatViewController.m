//
//  ChatViewController.m
//  Parse Chat
//
//  Created by Shirley Zhu on 6/27/22.
//

#import "ChatViewController.h"
#import <Parse/Parse.h>

@interface ChatViewController ()
@property (weak, nonatomic) IBOutlet UITextField *chatMessageField;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)sendText:(id)sender {
    PFObject *chatMessage = [PFObject objectWithClassName:@"Message_FBU2021"];
    // Use the name of your outlet to get the text the user typed
    chatMessage[@"text"] = self.chatMessageField.text;
    [chatMessage saveInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (succeeded) {
            NSLog(@"The message was saved!");
        } else {
            NSLog(@"Problem saving message: %@", error.localizedDescription);
        }
    }];
    self.chatMessageField.text = @"";
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
