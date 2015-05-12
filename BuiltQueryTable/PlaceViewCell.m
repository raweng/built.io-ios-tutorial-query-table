//
//  PlaceViewCell.m
//  BuiltQueryTable


#import "PlaceViewCell.h"

@interface PlaceViewCell()
@property (nonatomic, strong) NSArray *ratingsColor;
@end

@implementation PlaceViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.ratingsColor = [[NSArray alloc] initWithObjects:
                             RGBACOLOR(0, 0, 0, 0),
                             RGBACOLOR(241, 22, 0, 1),
                             RGBACOLOR(239, 61, 1, 1),
                             RGBACOLOR(239, 81, 0, 1),
                             RGBACOLOR(239, 114, 0, 1),
                             RGBACOLOR(241, 150, 0, 1),
                             RGBACOLOR(234, 182, 2, 1),
                             RGBACOLOR(225, 223, 18, 1),
                             RGBACOLOR(181, 189, 14, 1),
                             RGBACOLOR(114, 192, 21, 1),
                             RGBACOLOR(49, 142, 14, 1),nil];
        // Initialization code
    }
    return self;
}

-(UILabel *)placenameLabel{
    if (!_placenameLabel) {
        _placenameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _placenameLabel.font = [UIFont systemFontOfSize:15.0];
        _placenameLabel.text = @"Kolhapuri Dhaba";
    }
    return _placenameLabel;
}

-(UILabel *)placeLikesLabel{
    if (!_placeLikesLabel) {
        _placeLikesLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _placeLikesLabel.font = [UIFont systemFontOfSize:10.0];
    }
    return _placeLikesLabel;
}

-(UILabel *)ratingsLabel{
    if (!_ratingsLabel) {
        _ratingsLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [_ratingsLabel.layer setCornerRadius:5.0f];
        _ratingsLabel.textAlignment = NSTextAlignmentCenter;
        _ratingsLabel.font = [UIFont systemFontOfSize:12.0];
        _ratingsLabel.text = @"5.0";
    }
    return _ratingsLabel;
}

-(void)loadPlaces:(BuiltObject *)builtObject{
    self.placenameLabel.text = [builtObject objectForKey:@"place_name"];
    
    int colorCode = [[builtObject objectForKey:@"ratings"] intValue];
    colorCode = (colorCode > 10 ? 10: colorCode);
    self.ratingsLabel.backgroundColor = [self.ratingsColor objectAtIndex:colorCode];
    
    self.ratingsLabel.text = [NSString stringWithFormat:@"%.1f",[[builtObject objectForKey:@"ratings"] floatValue]];
    
    self.placeLikesLabel.text = [NSString stringWithFormat:@"Likes: %d",[[builtObject objectForKey:@"likes"] intValue]];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat yPOS = 0.0;
    
    [self.placenameLabel setFrame:CGRectMake(10, 10, 250, 18)];
    yPOS = CGRectGetMaxY(self.placenameLabel.frame);
    
    [self.placeLikesLabel setFrame:CGRectMake(10, yPOS + 5, 150, 15)];
    
    [self.ratingsLabel setFrame:CGRectMake(0, 0, 28, 20)];
    [self.ratingsLabel setCenter:CGPointMake(self.frame.size.width - 14 - 5, self.frame.size.height / 2)];
    
    [self addSubview:self.placenameLabel];
    [self addSubview:self.ratingsLabel];
    [self addSubview:self.placeLikesLabel];
}

-(void)prepareForReuse{
    [super prepareForReuse];
    
    self.placenameLabel.text = nil;
    self.ratingsLabel.text = nil;
    self.placeLikesLabel.text = nil;
}


@end
