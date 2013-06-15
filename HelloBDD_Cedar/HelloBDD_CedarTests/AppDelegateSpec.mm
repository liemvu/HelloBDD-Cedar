#import "AppDelegate.h"
#import "ViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *model;

    beforeEach(^{
        model = [[AppDelegate alloc] init];
        
    });
    
    describe(@"startup", ^{
        __block BOOL launchSuccess;
        beforeEach(^{
            launchSuccess = [model application:[UIApplication sharedApplication] didFinishLaunchingWithOptions:@{}];
        });
        
        it(@"should lauch successfully", ^{
            launchSuccess should be_truthy;
        });
        
        describe(@"the window", ^{
            __block UIWindow * window;
            beforeEach(^{
                window = model.window;
            });
            
            it(@"should be initialized", ^{
                window!=nil should be_truthy;
            });
            
            it(@"should be key window", ^{
                window.isKeyWindow should be_truthy;
            });
            
            it(@"should be visible", ^{
                window.isHidden should_not be_truthy;
            });
            
            describe(@"the root view controller", ^{
                __block ViewController * viewController;
                beforeEach(^{
                    viewController = (ViewController *) window.rootViewController;
                });
                
                it(@"should be the home view controller", ^{
                    [viewController isKindOfClass:[ViewController class]] should be_truthy;
                });
            });
        });
    });
});

SPEC_END
