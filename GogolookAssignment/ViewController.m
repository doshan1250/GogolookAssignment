//
//  ViewController.m
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "WebManager.h"
#import "TravelItem.h"

NSInteger estimatedRowHeight = 155;
NSInteger loadMoreDataOffset = 5;
NSInteger loadDataLimit = 10;

@interface ViewController () <UITableViewDataSource,UITableViewDelegate> {
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) TravelItem *dataItem;
@end

@implementation ViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self initUI];
    
    [self loadingMoreDataIfNeed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return estimatedRowHeight;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataItem.travelDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    [cell bindModel:self.dataItem.travelDataArray[indexPath.row]];
    
    
    // Load more data
    if (self.dataItem.hasMore == true) {
        if (indexPath.row == self.dataItem.travelDataArray.count - loadMoreDataOffset) {
            [self loadingMoreDataIfNeed];
        }
    }
    
    return cell;
}
#pragma mark - Private method
-(void) initUI{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = estimatedRowHeight;
}
-(void) initData{
    self.dataItem = [TravelItem new];
}
-(void) loadingMoreDataIfNeed{
    id<IWeb> webMgr = [WebManager new];
    [webMgr doRequestTravelDataWithLimit:loadDataLimit offset:self.dataItem.offset SuccessBlock:^(bool hasMore, NSInteger offset, NSArray *resultArray) {
        self.dataItem.hasMore = hasMore;
        self.dataItem.offset = offset;
        [self.dataItem.travelDataArray addObjectsFromArray:resultArray];
        [self.tableView reloadData];
        
    } failureBlock:^(NSError *error) {
        
    }];
}

@end
