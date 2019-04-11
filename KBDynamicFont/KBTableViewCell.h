//
//  KBTableViewCell.h
//  KBDynamicFont
//
//  Created by BIMiracle on 4/11/19.
//  Copyright © 2019 BIMiracle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBButton.h"

@interface KBTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet KBButton *topButton;

@property (nonatomic, weak) IBOutlet UILabel *label;

@end
