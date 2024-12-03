#import <Foundation/Foundation.h>

int main (int const argc, char const* argv[])
{
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc]init];

    NSString* file = @"puzzle-input.txt";
    NSError* error;
    NSString* text = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:&error];

    NSScanner* scanner = [NSScanner scannerWithString:text];

    NSMutableArray* leftList = [NSMutableArray array];
    NSMutableArray* rightList = [NSMutableArray array];
    
    NSInteger number;
    while ([scanner scanInteger:&number])
    {
        [leftList addObject:[NSNumber numberWithInt: number]];

        [scanner scanInteger:&number];
        [rightList addObject:[NSNumber numberWithInt: number]];
    }

    [leftList sortUsingSelector:@selector(compare:)];
    [rightList sortUsingSelector:@selector(compare:)];

    NSInteger summedDifferences = 0;
    int i = 0;
    for (; i < [leftList count]; ++i)
    {
        summedDifferences += abs([[leftList objectAtIndex:i] intValue] - [[rightList objectAtIndex:i] intValue]);
    }

    NSLog(@"Total Distance: %i", summedDifferences);

    [pool drain];
    return 0;
}
