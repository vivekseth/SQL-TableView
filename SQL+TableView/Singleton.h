//
//  Singleton.h
//  KissXMLTest
//
//  Created by Vivek Seth on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
    
}

@property (nonatomic, retain) NSDictionary *selectedRowDictionary;

+(Singleton*)sharedSingleton;
-(void)sayHello;
@end
