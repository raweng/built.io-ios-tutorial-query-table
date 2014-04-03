//
//  BuiltQueryTableViewController.m
//  BuiltQueryTable
//


//***********************************************************************************************************
// This class extends from built.io's BuiltUITableViewController.
// Its has built-in BuiltQuery object, so that there's no need to create BuiltQuery and execute it with exec method.
// We can directly apply constraints/pagination/referential query methods on this query object and BuiltUITableViewController
// automatically executes the query and presents you the result BuiltObject s.
//***********************************************************************************************************

#import "BuiltQueryTableViewController.h"
#import "PlaceViewCell.h"

@interface BuiltQueryTableViewController ()

@end

@implementation BuiltQueryTableViewController

//***********************************************************************************************************
// specify the constraints/referential/pagination query method on built-in BuiltQuery object by BuiltUITableViewController's
// initWithStyle
//***********************************************************************************************************
-(id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Tasks";
        self.enablePullToRefresh = YES;
        self.fetchLimit = 10;
        
//  Add a constraint to the query that requires a particular key's object to be greater than or equal to the provided object
        [self.builtQuery whereKey:@"ratings" greaterThanOrEqualTo:[NSNumber numberWithInt:8.0]];
        [self.builtQuery orderByAscending:@"created_at"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // iOS 7
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self refresh];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath builtObject:(BuiltObject *)builtObject{
    static NSString *CellIdentifier = @"CellIdentifier";
    
    PlaceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[PlaceViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell loadPlaces:builtObject];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
