//
//  RFAuthenticationProvider.m
//  ROADWebservice
//
//  Copyright (c) 2014 EPAM Systems, Inc. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  Redistributions of source code must retain the above copyright notice, this
//  list of conditions and the following disclaimer.
//  Redistributions in binary form must reproduce the above copyright notice, this
//  list of conditions and the following disclaimer in the documentation and/or
//  other materials provided with the distribution.
//  Neither the name of the EPAM Systems, Inc.  nor the names of its contributors
//  may be used to endorse or promote products derived from this software without
//  specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  See the NOTICE file and the LICENSE file distributed with this work
//  for additional information regarding copyright ownership and licensing

#import "RFAuthenticationProvider.h"
#import "NSError+RFWebService.h"

NSString * const kRFAuthorizationKey = @"authorization";

const int kRFUnauthorizedCode =  401;
const int kRFProxyAuthenticationRequiredCode =  407;

@implementation RFAuthenticationProvider

@synthesize webServiceClient = _webServiceClient;
@synthesize successBlocks = _successBlocks;
@synthesize failureBlocks = _failureBlocks;

#pragma mark - Initialization

- (id)init {
    self = [super init];
    if (self) {
        _sessionOpened = NO;
        _successBlocks = [[NSMutableSet alloc] init];
        _failureBlocks = [[NSMutableSet alloc] init];
    }
    return self;
}

#pragma mark - RFAuthenticating

- (void)authenticate {
    @throw [NSException exceptionWithName:@"AbstractMethodInvocationException"
                                   reason:@"Override method in subclasses, invoke this method on concrete subclasses."
                                 userInfo:nil];
}

- (void)authenticateWithSuccessBlock:(RFAuthenticationSuccessBlock)successBlock failureBlock:(RFAuthenticationFailureBlock)failureBlock {
    [_successBlocks addObject:successBlock];
    [_failureBlocks addObject:failureBlock];
    
    [self authenticate];
}

- (void)invalidate {
    @throw [NSException exceptionWithName:@"AbstractMethodInvocationException"
                                   reason:@"Override method in subclasses, invoke this method on concrete subclasses."
                                 userInfo:nil];
}

- (void)processAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge forConnection:(NSURLConnection *)connection {

    if (challenge.previousFailureCount) {
        [self callFailureBlocksWithError:[NSError errorWithDomain:kRFWebServiceErrorDomain code:kRFUnauthorizedCode userInfo:nil]];
    }
    else if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
    }
}

#pragma mark - Support methods

- (void)callFailureBlocksWithError:(NSError *)error {
    for (RFAuthenticationFailureBlock failureBlock in _failureBlocks) {
        failureBlock(error);
    }
    [self releaseCompletionBlocks];
}

- (void)callSuccessBlocksWithResult:(id)result {
    for (RFAuthenticationSuccessBlock successBlock in _successBlocks) {
        successBlock(result);
    }
    [self releaseCompletionBlocks];
}

- (void)releaseCompletionBlocks {
    [_successBlocks removeAllObjects];
    [_failureBlocks removeAllObjects];
}

@end
