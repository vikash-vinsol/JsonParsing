//
//  MyTableViewController.h
//  Json
//
//  Created by Vikash Soni on 24/09/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController

{
    NSArray *user;
    NSDictionary *details;
    NSString *name;
    NSString *email;
    NSString *mobile;
    IBOutlet UITableView *tabView;
    
}
@end
