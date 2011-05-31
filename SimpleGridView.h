
#import <UIKit/UIKit.h>

@interface SimpleGridView : UIView {
    
@private
    NSInteger columns;
    NSInteger margin;
    
}

@property (nonatomic, assign) NSInteger columns;
@property (nonatomic, assign) NSInteger margin;

- (SimpleGridView*)initWithFrame:(CGRect)frame columns: (NSInteger)nbColumns;
- (id)initWithFrame:(CGRect)frame columns: (NSInteger)nbColumns margin: (NSInteger)aMargin;
- (void)reloadSubviews;

@end
