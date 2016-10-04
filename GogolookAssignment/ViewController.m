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
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.dataItem getDataDictionary].allKeys[section];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.dataItem getDataDictionary].count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *category = [[self.dataItem getDataDictionary].allKeys objectAtIndex:section];
    return [[[self.dataItem getDataDictionary] objectForKey:category] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    NSString *category = [[self.dataItem getDataDictionary].allKeys objectAtIndex:indexPath.section];
    [cell bindModel:[self.dataItem getDataDictionary][category][indexPath.row]];
    
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

- (IBAction)actionFilter:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Filter function" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    for (NSString *category in [self.dataItem getAllCategories]) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:category style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self handleWithKey:category];
        }];
        [alertController addAction:action];
    }
    [self presentViewController:alertController animated:YES completion:nil];
}


-(void) loadingMoreDataIfNeed{
    id<IWeb> webMgr = [WebManager new];
    [webMgr doRequestTravelDataWithSuccessBlock:^(bool hasMore, NSInteger offset, NSDictionary *result) {
        
        [self.dataItem setDataDictionary:result];
        [self.tableView reloadData];
        
    } failureBlock:^(NSError *error) {
        
    }];
}

-(void) handleWithKey:(NSString *)key{
    [self.dataItem setFilterKey:key];
    [self.tableView reloadData];
}

@end
