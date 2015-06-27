//
//  TestAssessmentTests.m
//  TestAssessmentTests
//
//  Created by Michael Kavouras on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TestViewController.h"
#import <objc/message.h>

@interface TestAssessmentTests : XCTestCase

@property (nonatomic) TestViewController *tvc;

@end

@implementation TestAssessmentTests

- (void)setUp {
    [super setUp];
    self.tvc = [[TestViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReturnsInteger {
    Method method1 = class_getInstanceMethod([TestViewController class], @selector(shouldReturnAPositiveInt));
    char * method1ReturnType = method_copyReturnType(method1);
    NSString *mt = [NSString stringWithCString:method1ReturnType encoding:NSUTF8StringEncoding];
    XCTAssert([mt isEqualToString:@"i"] || [mt isEqualToString:@"q"] && [self.tvc shouldReturnAPositiveInt] > 0);
}

- (void)testReturnsFloat {
    Method method1 = class_getInstanceMethod([TestViewController class], @selector(shouldReturnANegativeFloat));
    char * method1ReturnType = method_copyReturnType(method1);
    NSString *mt = [NSString stringWithCString:method1ReturnType encoding:NSUTF8StringEncoding];
    XCTAssert([mt isEqualToString:@"f"] || [mt isEqualToString:@"q"]);
}

- (void)testFloatIsLessThanZero {
    XCTAssert([self.tvc shouldReturnANegativeFloat] && [self.tvc shouldReturnANegativeFloat] < 0);
}

- (void)testNegativeBoolReturnType {
    Method method1 = class_getInstanceMethod([TestViewController class], @selector(shouldReturnANegativeBool));
    char * method1ReturnType = method_copyReturnType(method1);
    NSString *mt = [NSString stringWithCString:method1ReturnType encoding:NSUTF8StringEncoding];
    XCTAssert([mt isEqualToString:@"B"] && [self.tvc shouldReturnANegativeBool] == NO);
}

- (void)test0to100ReturnsInt {
    Method method1 = class_getInstanceMethod([TestViewController class], @selector(shouldReturnSumOf0To100));
    char * method1ReturnType = method_copyReturnType(method1);
    NSString *mt = [NSString stringWithCString:method1ReturnType encoding:NSUTF8StringEncoding];
    XCTAssert([mt isEqualToString:@"i"] || [mt isEqualToString:@"q"]);
}

- (void)testShouldReturnSumOf0To100 {
    XCTAssert([self.tvc shouldReturnSumOf0To100] == 4950);
}

@end
