//
//  AppDelegate.m
//  BuiltQueryTable


#import "AppDelegate.h"
#import "BuiltQueryTableViewController.h"

@implementation AppDelegate

// **************************************************************************************************
// BuiltQueryTable app gives objects related to equal or greater ratings .
// Objects related to equal or greater ratings varies w.r.t object that must be equalled ratings
// **************************************************************************************************


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //***********************************************************************************************************
    // Initialize Built class with your application's API-KEY and APP-UID
    [Built initializeWithApiKey:@"blt9f2f3c1d77c907e0" andUid:@"geofencing"];
    //***********************************************************************************************************
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    
    // ****************************************************************************
    // Initialize built.io UI element BuiltUITableViewController with class UID
    // ****************************************************************************
    
    BuiltQueryTableViewController *VC = [[BuiltQueryTableViewController alloc]initWithStyle:UITableViewStylePlain withClassUID:@"places"];
    UINavigationController *nav = [[UINavigationController alloc]  initWithRootViewController:VC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
