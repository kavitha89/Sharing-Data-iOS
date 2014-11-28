//
//  PasteBoardTableViewController.m
//  SharedApplicationDemoBITS
//
//  Created by kavitha on 25/11/14.
//  Copyright (c) 2014 Cognizant. All rights reserved.
//

#import "PasteBoardTableViewController.h"

@interface PasteBoardTableViewController ()

@end

@implementation PasteBoardTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated
{
      [self readDataFromPasteBoard];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 
 
 Reads data from UIPasteBoard stored from application one.
 
 **/
-(void)readDataFromPasteBoard
{
    UIPasteboard * pasteboard=[UIPasteboard generalPasteboard];
    NSData * data = [pasteboard dataForPasteboardType:@"MyPasteBoardSpaces"];
    NSString * text =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Text =%@",text);
    
    // Convert to JSON object:
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:[text dataUsingEncoding:NSUTF8StringEncoding]
                                                               options:0 error:NULL];
    NSLog(@"jsonObject=%@", jsonObject);
    
    self.dataDict = jsonObject;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataDict.allKeys.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pasteboardCell" forIndexPath:indexPath];
    
    // Configure the cell..
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.dataDict objectForKey:[[self.dataDict allKeys] objectAtIndex:indexPath.row]]];
    NSLog(@"%@",cell.textLabel.text);

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
