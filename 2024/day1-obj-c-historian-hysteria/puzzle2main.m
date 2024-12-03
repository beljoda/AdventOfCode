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

    NSInteger similarityScore = 0;
    for (id target in leftList)
    {
        NSInteger occurrences = 0;
        for (id rightCandidate in rightList) {
            if ([target isEqual:rightCandidate]) {
                ++occurrences;
            }
        }

        similarityScore += [target intValue] * occurrences;
    }

    NSLog(@"Similarity Score: %i", similarityScore);

    [pool drain];
    return 0;
}
