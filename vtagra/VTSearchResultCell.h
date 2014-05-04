//
//  VTSearchResultCell.h
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTSearchResultCell : UITableViewCell
@property(nonatomic, weak) IBOutlet UIImageView *thumbnail;
@property(nonatomic, weak) IBOutlet UILabel *name;
@end
