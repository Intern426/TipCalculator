//
//  TipViewController.m
//  Tip Calculator
//
//  Created by Kalkidan Tamirat on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SettingsViewController* controller = [[SettingsViewController alloc] init];
    controller.delegate = self;

    // Do any additional setup after loading the view.
    [self.billAmountField becomeFirstResponder];
}
- (IBAction)onTap:(id)sender {    
    [self.view endEditing:true]; // YES does the same thing (YES = true)
}

-(void) passDefaultTip:(UISegmentedControl*) selectedTip {
    self.tipPercentageControl.selectedSegmentIndex = selectedTip.selectedSegmentIndex;
}

- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y  += 200;
        
        self.billAmountField.frame = billFrame;

        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0; // When 1, view is fully visible. When 0, view fades away
    }];
}

- (void)showLabels {
    return;
}

- (IBAction)onEditing:(id)sender {
    if (self.billAmountField.textColor != [UIColor blackColor])  {
        self.billAmountField.text = @"";
        self.billAmountField.textColor = [UIColor blackColor];
    }
}

- (IBAction)onNotEditing:(id)sender {
    if(self.billAmountField.text.length == 0) {
        self.billAmountField.text = @"$";
        self.billAmountField.textColor = [UIColor grayColor];
    }
}

- (IBAction)updateLabels:(id)sender {
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billAmountField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
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
