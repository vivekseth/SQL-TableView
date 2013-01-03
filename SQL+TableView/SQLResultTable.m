//
//  SQLResultTable.m
//  FMDBTest
//
//  Created by Vivek Seth on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SQLResultTable.h"
#import "FMDatabase.h"
#import "Singleton.h"
#import "CustomCell.h"


@implementation SQLResultTable

@synthesize ResultSet = _ResultSet;
@synthesize ResultSetArray = _ResultSetArray;
@synthesize database = _database;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
        
    NSString * path = [[NSBundle mainBundle] pathForResource:@"chinook" ofType:@"sqlite"];
    self.database = [FMDatabase databaseWithPath:path];
    
    [self.database open];
    FMResultSet *results = [self.database executeQuery:@"select * from track"];    
    NSMutableArray * contentsOfQuery = [[NSMutableArray alloc] init];
    while([results next]) {
        NSDictionary * row = [results resultDictionary];
        [contentsOfQuery addObject:row];
    }
    [self.database close];
    
    NSLog(@"rows in array = %i", [contentsOfQuery count]);
    
    self.ResultSetArray = contentsOfQuery;
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.rowHeight = 100;
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    
        
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    return [self.ResultSetArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];    
    
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UILabel * TrackId = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)];
    TrackId.text = [[[self.ResultSetArray objectAtIndex:indexPath.row] objectForKey:@"Milliseconds"] stringValue];
    TrackId.textColor = [UIColor redColor];
    [cell addSubview:TrackId];
    
    UILabel * Name = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 200, 20)];
    Name.numberOfLines = 0;
    Name.text = [[self.ResultSetArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
    [cell addSubview:Name];
    
    
    //cell.textLabel.text = [[self.ResultSetArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
    
//    
//    
//    NSDictionary * rowDict = [self.ResultSetArray objectAtIndex:indexPath.row];
//    NSArray * rowArray = [[NSArray alloc] initWithArray:[rowDict allValues]];
//    
//    NSLog(@"row values: *%@, *%@, *%@, *%@, %@, %@, %@", [rowArray objectAtIndex:0], [rowArray objectAtIndex:1], [rowArray objectAtIndex:2], [rowArray objectAtIndex:4], [rowArray objectAtIndex:5], [rowArray objectAtIndex:6], [rowArray objectAtIndex:8]);
//    
    
    //NSLog([[self.ResultSetArray objectAtIndex:indexPath.row] objectForKey:@"Name"]);
    
    //cell.Name.text = [[self.ResultSetArray objectAtIndex:indexPath.row] objectForKey:@"Name"];
    
        //NSLog(@"row:%i composer:%@", indexPath.row, [[self.ResultSetArray objectAtIndex:indexPath.row] objectForKey:@"Composer"]);
    
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toDetailView"])
    {
        [Singleton sharedSingleton].selectedRowDictionary = [self.ResultSetArray objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        NSLog(@"selected row: %i", [self.tableView indexPathForSelectedRow].row);
    }
}


@end
