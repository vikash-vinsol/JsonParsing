//
//  MyTableViewController.m
//  Json
//
//  Created by Vikash Soni on 24/09/13.
//  Copyright (c) 2013 Vikash Soni. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyCellView.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kLatestKivaLoansURL [NSURL URLWithString:@"http://api.androidhive.info/contacts/"]
{

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_async(kBgQueue, ^{
                                    NSData* data = [NSData dataWithContentsOfURL:kLatestKivaLoansURL];
                                    [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
                                });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return user.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyCell";
    MyCellView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    details = [user objectAtIndex:indexPath.row];
    cell.nameLabel.text = [details objectForKey:@"name"];
    cell.emailLable.text = [details objectForKey:@"email"];
    cell.numberLabel.text = [(NSDictionary*)[details objectForKey:@"phone"]objectForKey:@"mobile"];
    
    return cell;
}

- (void)fetchedData:(NSData *)responseData
{
    //parse out the json data
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    user = [json objectForKey:@"contacts"];
    [tabView reloadData];
}


@end
