//
//  ViewController.m
//  SectionTable
//
//  Created by Developer on 23/11/12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tblDictionary;
@synthesize keyArray;


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 320, 20)];

    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setText:[keyArray objectAtIndex:(NSUInteger) section]];

    [header setBackgroundColor:[UIColor blackColor]];
    [header addSubview:lbl];

    return header;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [keyArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *ary = [self.tblDictionary valueForKey:[keyArray objectAtIndex:(NSUInteger) section]];
    return [ary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    NSString *key = [keyArray objectAtIndex:(NSUInteger) [indexPath section]];
    NSArray *array = (NSArray *)[self.tblDictionary valueForKey:key];
    NSString *cellTitle = [array objectAtIndex:(NSUInteger) [indexPath row]];
    [cell.textLabel setText:cellTitle];

    return cell;
}

-(NSMutableDictionary *)fillingDictionary:(NSMutableArray *)ary {
    
    keyArray = [[NSMutableArray alloc]init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [ary sortUsingSelector:@selector(compare:)];  // First sort the array
    for(NSString *str in ary)
    {
        char charval = (char) [str characterAtIndex:0];   // Get the first character of your string which will be your key
        NSString *charStr = [NSString stringWithUTF8String:&charval];
        if(![keyArray containsObject:charStr])
        {
            NSMutableArray *charArray = [[NSMutableArray alloc]init];
            [charArray addObject:str];
            [keyArray addObject:charStr];
            [dic setValue:charArray forKey:charStr];
        }
        else
        {
            NSMutableArray *prevArray = (NSMutableArray *)[dic valueForKey:charStr];
            [prevArray addObject:str];
            [dic setValue:prevArray forKey:charStr];
        }
    }
    return dic;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *ary = [[NSMutableArray alloc]init];
    
    [ary addObject:@"g1"];
    [ary addObject:@"i1"];
    [ary addObject:@"g2"];
    [ary addObject:@"g3"];
    [ary addObject:@"d1"];
    [ary addObject:@"g4"];
    [ary addObject:@"g5"];
    [ary addObject:@"g6"];
    [ary addObject:@"g7"];
    [ary addObject:@"u1"];
    [ary addObject:@"h1"];
    [ary addObject:@"m1"];
    [ary addObject:@"m2"];
    [ary addObject:@"i2"];
    [ary addObject:@"s1"];
    [ary addObject:@"d1"];
    [ary addObject:@"f1"];
    [ary addObject:@"g8"];
    [ary addObject:@"h2"];
    [ary addObject:@"j1"];
    [ary addObject:@"k1"];
    [ary addObject:@"l1"];
    
    self.tblDictionary = [self fillingDictionary:ary];
    
    [self.tbl reloadData];
    
 	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
