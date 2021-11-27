#import "../YouTubeHeader/YTPlayerViewController.h"
#import "../YouTubeHeader/YTWatchController.h"

%hook YTPlayerViewController

- (void)playbackController:(id)arg1 didActivateVideo:(id)arg2 withPlaybackData:(id)arg3 {
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        YTWatchController *watchController = [self valueForKey:@"_UIDelegate"];
        [watchController showFullScreen];
    });
}

%end