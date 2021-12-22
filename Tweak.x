#import "../YouTubeHeader/YTPlayerViewController.h"
#import "../YouTubeHeader/YTWatchController.h"

@interface YTPlayerViewController (YTAFS)
- (void)autoFullscreen;
@end

%hook YTPlayerViewController

- (void)loadWithPlayerTransition:(id)arg1 playbackConfig:(id)arg2 {
    %orig;
    [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(autoFullscreen) userInfo:nil repeats:NO];
}

%new
- (void)autoFullscreen {
    YTWatchController *watchController = [self valueForKey:@"_UIDelegate"];
    [watchController showFullScreen];
}

%end
