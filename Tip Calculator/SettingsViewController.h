//
//  SettingsViewController.h
//  Tip Calculator
//
//  Created by Kalkidan Tamirat on 6/22/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//@protocol SettingsViewControllerDelegate;

@protocol SettingsViewControllerDelegate <NSObject>
-(void) setDefaultTip:(NSInteger) selectedTip;
@end


@interface SettingsViewController : UIViewController
@property (nonatomic, weak)id <SettingsViewControllerDelegate> delegate;
@end


NS_ASSUME_NONNULL_END
