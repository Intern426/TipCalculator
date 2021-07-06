//
//  SettingsViewController.m
//  Tip Calculator
//
//  Created by Kalkidan Tamirat on 6/22/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"Hello world?");
}
*/
- (IBAction)tapSave:(UIButton *)sender {
    [self.delegate setDefaultTip:self.tipPercentageControl.selectedSegmentIndex];
    [self dismissViewControllerAnimated:true completion:nil];
}


- (IBAction)tapClose:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
