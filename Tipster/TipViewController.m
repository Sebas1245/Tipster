//
//  TipViewController.m
//  Tipster
//
//  Created by Sebastian Saldana Cardenas on 22/06/21.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:(true)];
}

- (IBAction)updateLabels:(id)sender {
    double tipPercentages[] = {0.15,0.20,0.25};
    double tipPercentage = tipPercentages [self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    NSLog(@"%f",tip);
    NSLog(@"%f",total);
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f",tip ];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",total ];
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
