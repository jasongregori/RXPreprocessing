#import <XCTest/XCTest.h>

#import <RXPreprocessing/RXPreprocessing.h>

@interface RXPreprocessingTests : XCTestCase
@end

@implementation RXPreprocessingTests

-(void)testInterpolationConstructsStrings {
    
    ([@[
        ((^NSString *{ __typeof__(1) _rx_cached_value = (1); return [NSString stringWithFormat:[NSString stringWithFormat:@"%%%s%@", "", _rx_format_type_specifier_for_value(_rx_cached_value)], _rx_cached_value]; })()),
        ((^NSString *{ __typeof__(@2) _rx_cached_value = (@2); return [NSString stringWithFormat:[NSString stringWithFormat:@"%%%s%@", "", _rx_format_type_specifier_for_value(_rx_cached_value)], _rx_cached_value]; })()),
        ((^NSString *{ __typeof__(@"3") _rx_cached_value = (@"3"); return [NSString stringWithFormat:[NSString stringWithFormat:@"%%%s%@", "", _rx_format_type_specifier_for_value(_rx_cached_value)], _rx_cached_value]; })()), @""
        ] componentsJoinedByString:@""]);
    
    /*
     old code
         ([@[((^NSString *{ __typeof__(1) _rx_cached_value = (1); return [NSString stringWithFormat:[NSString stringWithFormat:@"%%%s%@", "", _rx_format_type_specifier_for_value(_rx_cached_value)], _rx_cached_value]; })()), ((^NSString *{ __typeof__(@2) _rx_cached_value = (@2); return [NSString stringWithFormat:[NSString stringWithFormat:@"%%%s%@", "", _rx_format_type_specifier_for_value(_rx_cached_value)], _rx_cached_value]; })()), ((^NSString *{ __typeof__(@"3") _rx_cached_value = (@"3"); return [NSString stringWithFormat:[NSString stringWithFormat:@"%%%s%@", "", _rx_format_type_specifier_for_value(_rx_cached_value)], _rx_cached_value]; })()), @""] componentsJoinedByString:@""]);
     */
//    rx_q(rx_f(4., ""));
//    rx_q(1, @2, @"3");

    
#pragma clang diagnostic ignored "-Wformat"
    ([NSString stringWithFormat:(_Generic((1), int32_t: @"%i", id: @"%@") _Generic((@2), int32_t: @"%i", id: @"%@") _Generic((@"3"), int32_t: @"%i", id: @"%@") @""), 1, @2, @"3"]);
#pragma clang diagnostic pop

//    rx_q(1, @2, @"3");
    
    
//    rx_fold(_rx_q_format_each2, @"", 1, @"3");
    
    id x = [NSString stringWithFormat:(_rx_q_format_specifier(1)),1];
    XCTAssertEqualObjects(x, @"1");
    
//    x = [NSString stringWithFormat:(_Generic((1), int32_t: @"%i", id: @"%@")),1];
//    
//    ({ @try { id a1value = ([NSString stringWithFormat:(_Generic((1), int32_t: @"%i", id: @"%@"))); id a2value = (1]); if ((a1value != a2value) && ![a1value isEqual:a2value]) { ({ _XCTFailureHandler(self, __objc_yes, "/Users/jasongregori/src/forks/RXPreprocessing/RXPreprocessingTests/RXPreprocessingTests.m", 27, ({
//        [NSString stringWithFormat:_XCTFailureFormat(_XCTAssertion_EqualObjects, 0), @"" @"[NSString stringWithFormat:(_Generic((1), int32_t: @\"%i\", id: @\"%@\"))", @"1]", a1value, a2value];
//    }), @"" @"1"); }); } } @catch (id exception) { ({ _XCTFailureHandler(self, __objc_yes, "/Users/jasongregori/src/forks/RXPreprocessing/RXPreprocessingTests/RXPreprocessingTests.m", 27, ({
//        [NSString stringWithFormat:_XCTFailureFormat(_XCTAssertion_EqualObjects, 1), @"" @"[NSString stringWithFormat:(_Generic((1), int32_t: @\"%i\", id: @\"%@\"))", @"1]", [exception reason]];
//    }), @"" @"1"); }); }});

//    XCTAssertEqualObjects([NSString stringWithFormat:(_rx_q_format_specifier(1)),1], @"1");
//    XCTAssertEqualObjects(_rx_q_format_specifier(1), @"d");
}

@end
