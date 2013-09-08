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
@synthesize tableArray;
@synthesize filteredArray;
@synthesize tblDictionary;
@synthesize keyArray;


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    [header setBackgroundColor:[UIColor blackColor]];
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 320, 20)];
    [header addSubview:lbl];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setText:[keyArray objectAtIndex:section]];
    return header;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
return  [keyArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSArray *ary=[self.tblDictionary valueForKey:[keyArray objectAtIndex:section]];
    return [ary count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    NSString *key=[keyArray objectAtIndex:[indexPath section]];
    NSArray *array=(NSArray *)[self.tblDictionary valueForKey:key];
    NSString *cellTitle=[array objectAtIndex:[indexPath row]];
    [cell.textLabel setText:cellTitle];
    return cell;
}

-(NSMutableDictionary *)fillingDictionary:(NSMutableArray *)ary
{
    keyArray=[[NSMutableArray alloc]init];
    [keyArray removeAllObjects];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
    [ary sortUsingSelector:@selector(compare:)];  // First sort the array
    for(NSString *str in ary)
    {
        char charval=[str characterAtIndex:0];   // Get the first character of your string which will be your key
        NSString *charStr=[NSString stringWithUTF8String:&charval];
        if(![keyArray containsObject:charStr])
        {
            NSMutableArray *charArray=[[NSMutableArray alloc]init];
            [charArray addObject:str];
            [keyArray addObject:charStr];
            [dic setValue:charArray forKey:charStr];
        }
        else
        {
            NSMutableArray *prevArray=(NSMutableArray *)[dic valueForKey:charStr];
            [prevArray addObject:str];
            [dic setValue:prevArray forKey:charStr];
        
        }
    
    }
    return dic;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *ary=[[NSMutableArray alloc]init];
    [ary addObject:@"gfwfhlr"];
    [ary addObject:@"irofhqrlo"];
    [ary addObject:@"gfwtgfhlr"];
    [ary addObject:@"gegirofgewghqrlo"];
    [ary addObject:@"dsfgverg"];
    [ary addObject:@"gergqrlo"];
    [ary addObject:@"gregerg"];
    [ary addObject:@"gegqrlo"];
    [ary addObject:@"getwgtgt"];
    [ary addObject:@"uyuqrlo"];
    [ary addObject:@"hmnjmj"];
    [ary addObject:@"mjhmghqrlo"];
    [ary addObject:@"mjmjm"];
    [ary addObject:@"irofhmjmjqrlo"];
    [ary addObject:@"sgfwfhlr"];
    [ary addObject:@"daimrofh;qrlo"];
    [ary addObject:@"fgfwfhlr"];
    [ary addObject:@"girofhqrlo"];
    [ary addObject:@"hgfwfhlr"];
    [ary addObject:@"jirofhqrlo"];
    [ary addObject:@"kgfwfhlr"];
    [ary addObject:@"lirofhqrlo"];
    
    self.tblDictionary =[self fillingDictionary:ary];
    [self.tbl reloadData];
    
 	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tbl release];
    [super dealloc];
}
@end
