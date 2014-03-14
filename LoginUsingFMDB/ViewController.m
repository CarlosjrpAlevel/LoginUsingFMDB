//
//  ViewController.m
//  LoginUsingFMDB
//
//  Created by Carlos Reinoso on 12/03/2014.
//  Copyright (c) 2014 Carlos Reinoso. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad

{
    [super viewDidLoad];
	//CREATE THE DATABASE
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"testingFMDB.db"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:path];
  //  FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if (![filemgr fileExistsAtPath:path]) {
        
        [database open];
    
        [database executeUpdate:@"CREATE TABLE Users(ID INTEGER PRIMARY KEY AUTOINCREMENT, Username TEXT, Password TEXT)"];
    
        [database executeUpdate:@"INSERT INTO Users(Username, Password) values(?,?)",@"user", @"pass",nil];
    

        [database executeUpdate:@"INSERT INTO Users(Username, Password) values(?,?)",@"1", @"1",nil];
    
        
        FMResultSet *results = [database executeQuery:@"select * from Users"];
        while([results next]) {
            NSString *username = [results stringForColumn:@"Username"];
            NSString *password  = [results stringForColumn:@"Password"];
            NSLog(@"User: %@ - %@",username, password);
        }
    
        [database close];
        
    } else {
        NSLog(@"Database Created");
        
    }
    
}

/*-(void) readLoginFromDatabase {
    
//    NSMutableArray *username = [[NSMutableArray alloc]init];
 //   NSMutableArray *password = [[NSMutableArray alloc]init];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"testingFMDB.db"];
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    
    
    [database open];
    
    FMResultSet *results = [database executeQuery:@"select * from Users"];
    while([results next]) {
        NSString *username = [results stringForColumn:@"Username"];
        NSString *password  = [results stringForColumn:@"Password"];
        NSLog(@"User: %@ - %@",username, password);
    }
    
    [database open];
    
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginbutton:(id)sender {
    
    
}
@end

