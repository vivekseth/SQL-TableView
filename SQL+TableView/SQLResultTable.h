//
//  SQLResultTable.h
//  FMDBTest
//
//  Created by Vivek Seth on 5/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface SQLResultTable : UITableViewController

@property (nonatomic, retain) FMResultSet * ResultSet;
@property (nonatomic, retain) NSMutableArray * ResultSetArray;
@property (nonatomic, retain) FMDatabase * database;

@end
