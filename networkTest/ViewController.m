//
//  ViewController.m
//  networkTest
//
//  Created by In Chung Yeul on 2014. 2. 3..
//  Copyright (c) 2014년 In Chung Yeul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>

@end

@implementation ViewController {
    NSMutableData *_buffer;
    NSURLConnection *connection1;
    NSURLConnection *connection2;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    NSURL *url1 = [NSURL URLWithString:@"http://mmdtest.cloulu.com/write"];
    NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:url1] ;
//    [request addValue:@"T4JC47GMzVl5a19lIQokMxxE8Nx5WheSeptT8346" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request1 setHTTPMethod:@"POST"];
    [request1 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // JSON Serialization
    // NSDictionary를 요청 데이터로
    __autoreleasing NSError *error1;
    NSDictionary *requestDic1 = @{@"message1": @"300", @"message2" : @"200", @"message3" : @"100"};
    NSData *postData1 = [NSJSONSerialization dataWithJSONObject:requestDic1 options:NSJSONWritingPrettyPrinted error:&error1];
    [request1 setHTTPBody:postData1];
    // POST에 데이터를 담아 보내는 것은 아직...
    [NSURLConnection connectionWithRequest:request1 delegate:self]; // 추가
    */
    NSDate *now = [NSDate date];
    NSString *snow = @"1";
//    /*
    NSURL *url2 = [NSURL URLWithString:@"http://mmdtest.cloulu.com/currentstatus"];
    NSMutableURLRequest *request2 = [NSMutableURLRequest requestWithURL:url2] ;
    [request2 setHTTPMethod:@"POST"];
    [request2 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    __autoreleasing NSError *error2;
    NSDictionary *requestDic2 = @{@"MmdCustomerInformationId": @"4"};
//    NSDictionary *requestDic2 = @{@"MmdCustomerInformationId": snow};
    NSLog(@"%@", requestDic2);
    NSData *postData2 = [NSJSONSerialization dataWithJSONObject:requestDic2 options:NSJSONWritingPrettyPrinted error:&error2];
    [request2 setHTTPBody:postData2];
    NSURLConnection *cc = [NSURLConnection connectionWithRequest:request2 delegate:self]; // 추가
//    */
    if (cc) {
        NSLog(@"success");
    }
    else {
        NSLog(@"fail");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _buffer = [[NSMutableData alloc] init];
    NSLog(@"%@", connection);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_buffer appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSUInteger option = kNilOptions;
    __autoreleasing NSError *error;
    // JSON 파싱:응답 데이터를 NSDictionary
    id result = [NSJSONSerialization JSONObjectWithData:_buffer options:option error:&error];
//    NSLog(@"Result : %@", [[[result objectForKey:@"results"] objectAtIndex:0] objectForKey:@"customerName"]);
    NSLog(@"Result : %@", result);
//    NSLog(@"Result : %@", [[[result objectForKey:@"results"] objectAtIndex:0] objectForKey:@"status3Timestamp"]);
    
    //NSDateFormatter 를 생성한다.
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    
    //데이트 형식을 지정한다.
    [inputFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'.000Z'"];
    
    //inputFormatter 에 지정한 형식대로 NSDate 가 생성된다.
    NSDate *formatterDate = [inputFormatter dateFromString:@"2014-02-03T07:13:19.000Z"];
    
    //위에 까지가 날짜 생성
    //NSDateFormatter 를 생성한다.
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    // 날짜 포맷을 세팅한다.
    [outputFormatter setDateFormat:@"mm"];
    
    //포맷된 형식되로 날짜를 NSString 으로 보여준다. formatterDate 은 위에서 세팅한 날짜 NSDate 값
    NSString *newDateString = [outputFormatter stringFromDate:formatterDate];
    
    //로그에 출력해서 본다.
    NSLog(@"newDateString %@", newDateString);
    
    /*
    NSLog(@"%@", [[[result objectForKey:@"results"] objectAtIndex:0] objectForKey:@"status3Timestamp"]);
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    NSDate *formatterDate = [inputFormatter dateFromString:[[[result objectForKey:@"results"] objectAtIndex:0] objectForKey:@"status3Timestamp"]];
    
    //위에 까지가 날짜 생성
    //NSDateFormatter 를 생성한다.
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    
    // 날짜 포맷을 세팅한다.
    [outputFormatter setDateFormat:@"HH:mm 'on' EEEE MMMM d"];
    
    //포맷된 형식되로 날짜를 NSString 으로 보여준다. formatterDate 은 위에서 세팅한 날짜 NSDate 값
    NSString *newDateString = [outputFormatter stringFromDate:formatterDate];
    
    //로그에 출력해서 본다.
    NSLog(@"newDateString %@", newDateString);
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
