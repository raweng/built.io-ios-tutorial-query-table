//
//  PlaceViewCell.h
//  BuiltQueryTable


#import <UIKit/UIKit.h>

@interface PlaceViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *placenameLabel;
@property (nonatomic, strong) UILabel *placeLikesLabel;
@property (nonatomic, strong) UILabel *ratingsLabel;

-(void)loadPlaces:(BuiltObject *)builtObject;

@end
