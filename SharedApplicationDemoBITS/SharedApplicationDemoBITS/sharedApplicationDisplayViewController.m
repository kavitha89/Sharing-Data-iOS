//
//  sharedApplicationDisplayViewController.m
//  SharedApplicationDemoBITS
//
//  Created by kavitha on 24/11/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "sharedApplicationDisplayViewController.h"
#import "PasteBoardTableViewController.h"
#import "URIScehemTableViewController.h"
#import "AppDelegate.h"

@interface sharedApplicationDisplayViewController ()

@property (nonatomic,strong) NSDictionary *dataDictionary;

@end

@implementation sharedApplicationDisplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if(appDelegate.uriSchemePiggyBackData.count>0)
    {
        self.dataDictionary = appDelegate.uriSchemePiggyBackData;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    // Make cell unselectable
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //cell.textLabel.text = [self.dataDictionary objectForKey:[[self.dataDictionary allKeys] objectAtIndex:indexPath.row]];
    
    switch ( indexPath.row ) {
		case 0: {
			cell.textLabel.text = @"PasteBoard" ;
			break ;
		}
		case 1: {
			cell.textLabel.text = @"URLScheme" ;
			break ;
		}
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ( indexPath.row ) {
		case 0: {
            PasteBoardTableViewController *pasteBoardVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PasteBoardTableViewController"];
            [self.navigationController pushViewController:pasteBoardVC animated:YES];
			break ;
		}
		case 1: {
            URIScehemTableViewController *uriSchemeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"URIScehemTableViewController"];
            [self.navigationController pushViewController:uriSchemeVC animated:YES];
			break ;
		}
    }
}



@end
