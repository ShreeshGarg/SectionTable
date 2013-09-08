//
//  ViewController.h
//  SectionTable
//
//  Created by Developer on 23/11/12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView   *tbl;
@property (strong, nonatomic) NSMutableDictionary    *tblDictionary;
@property (strong, nonatomic) NSMutableArray         *keyArray;

@end
