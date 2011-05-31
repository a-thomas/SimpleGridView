
#import "SimpleGridView.h"

#define DEFAULT_MARGIN 10

@implementation SimpleGridView

@synthesize columns;
@synthesize margin;


- (void)dealloc
{
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame columns: (NSInteger)nbColumns {
    return [self initWithFrame:frame columns:nbColumns margin:DEFAULT_MARGIN];
}

- (id)initWithFrame:(CGRect)frame columns: (NSInteger)nbColumns margin: (NSInteger)aMargin {
    
    if (nbColumns <= 0)
		[NSException raise: NSInvalidArgumentException format: @"columns number argument must be positive"];
    
    if (margin < 0)
		[NSException raise: NSInvalidArgumentException format: @"margin argument must be positive or equal to zero"];
    
    if ((self = [super initWithFrame:frame])) {
        columns = nbColumns;
        margin = aMargin;
    }
    
    return self;
}

- (void)addSubview:(UIView *)view {
    [super addSubview:view];   
    [self reloadSubviews];
}

- (void)reloadSubviews {
    //initialization
    int subviewsNumber = [self.subviews count];
    CGFloat widthMax = self.bounds.size.width - margin;
    CGFloat heightMax = self.bounds.size.height - margin;
    
    //init cells size
    CGFloat cellWidth = (widthMax/columns);
    CGFloat cellHeight = heightMax;
    
    CGFloat row = ceilf(((CGFloat)subviewsNumber / (CGFloat)columns));
    if (row > 0)
        cellHeight = (heightMax / row);
    
    int i=0;
    int x=0;
    int y=0;
    int currentRow=0;
    //resize and place subviews
    for (UIView *aView in self.subviews) {
        
        //update currentRow
        if (i%columns==0 && i>0) {
            currentRow++;
        }
        
        //update position
        y = cellHeight*currentRow;
        x = cellWidth*(i%columns);
        
        i++;
        [aView setFrame:CGRectMake(x+margin, y+margin, cellWidth-margin, cellHeight-margin)];
    }
}

@end
