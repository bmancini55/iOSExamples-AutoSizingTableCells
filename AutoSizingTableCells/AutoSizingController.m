//
//  AutoSizingController.m
//  AutoSizingTableCells
//
//  Created by Brian Mancini on 7/26/14.
//  Copyright (c) 2014 RedTurn. All rights reserved.
//

#import "AutoSizingController.h"
#import "AutoSizeCell.h"

@implementation AutoSizingController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)getText
{
    return @"This is some long text that should wrap. It is multiple long sentences that may or may not have spelling and grammatical errors. Yep it should wrap quite nicely and serve as a nice example!";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create a reusable cell
    AutoSizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"plerp"];
    if(!cell) {
        cell = [[AutoSizeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"plerp"];
    }
    
    // Configure the cell for this indexPath
    cell.textLabel.text = [self getText];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AutoSizeCell *cell = [[AutoSizeCell alloc] init];
    cell.textLabel.text = [self getText];
    
    // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints
    // (Note that the preferredMaxLayoutWidth is set on multi-line UILabels inside the -[layoutSubviews] method
    // in the UITableViewCell subclass
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    // Get the actual height required for the cell
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // Add an extra point to the height to account for the cell separator, which is added between the bottom
    // of the cell's contentView and the bottom of the table view cell.
    height += 1;
    
    return height;
}

@end
