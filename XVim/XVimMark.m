//
//  XVimMark.m
//  XVim
//
//  Created by Suzuki Shuichiro on 3/21/13.
//
//

#import "XVimMark.h"

@implementation XVimMark
@synthesize line = _line;
@synthesize column = _column;
@synthesize document = _document;

- (id)initWithLine:(NSUInteger)line column:(NSUInteger)col document:(NSString*)doc{
    if( self = [super init] ){
        _line = line;
        _column = col;
        [_document release];
        _document = [doc copy];
    }
    return self;
}

- (id)initWithMark:(XVimMark*)mark{
    if( nil == mark ){
        return [self initWithLine:NSNotFound column:NSNotFound document:nil];
    }else{
        return [self initWithLine:mark.line column:mark.column document:mark.document];
    }
}

- (void)setMark:(XVimMark *)mark
{
    if( mark == nil ){
        _line = NSNotFound;
        _column = NSNotFound;
        [_document release];
        _document = nil;
    } else {
        _line = mark.line;
        _column = mark.column;
        [_document release];
        _document = [mark.document copy];
    }
}

- (id)init{
    return [self initWithMark:nil];
}

- (void)dealloc{
    self.document = nil;
    [super dealloc];
}
@end
