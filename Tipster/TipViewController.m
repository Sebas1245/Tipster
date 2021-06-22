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
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UISlider *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;

@end

@implementation TipViewController
bool hidden = false;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:(true)];
}

- (IBAction)updateLabels:(id)sender {
    if(self.billField.text.length == 0) {
        [self hideLabels];
        hidden = true;
    }
    else if(hidden){
        hidden = false;
        [self showLabels];
    }
    [self changeAmounts];
}

- (IBAction)handlePercentageChange:(id)sender {
    self.percentageLabel.text = [NSString stringWithFormat:@"%.1f%%",self.tipAmount.value * 100 ];
    [self changeAmounts];
}

-(void)changeAmounts {
    double bill = [self.billField.text doubleValue];
    double tip = bill * self.tipAmount.value;
    double total = bill + tip;
    
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f",tip ];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",total ];
    self.totalLabel.alpha = 2;
}

-(void)hideLabels {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y += 200;
        self.billField.frame = billFrame;
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        self.labelsContainerView.frame = labelsFrame;
        self.labelsContainerView.alpha = 0;
    }];
    
}


-(void)showLabels {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect billFrame = self.billField.frame;
        billFrame.origin.y -= 200;
        self.billField.frame = billFrame;
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y -= 200;
        self.labelsContainerView.frame = labelsFrame;
        self.labelsContainerView.alpha = 1;
    }];
    
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
