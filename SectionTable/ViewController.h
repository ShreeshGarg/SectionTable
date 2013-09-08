//
//  ViewController.h
//  SectionTable
//
//  Created by Developer on 23/11/12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>



@property (retain, nonatomic) IBOutlet UITableView *tbl;
@property (nonatomic,retain) NSMutableDictionary *tblDictionary;
@property (nonatomic,retain)NSMutableArray *keyArray;
@property (nonatomic,retain)NSMutableArray *tableArray;
@property (nonatomic,retain)NSMutableArray *filteredArray;
@end
