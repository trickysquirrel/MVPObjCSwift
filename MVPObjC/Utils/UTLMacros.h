//
//  UTLMacros.h
//  MVPObjC
//
//  Created by Richard Moult on 4/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

#ifndef UTLMacros_h
#define UTLMacros_h

#define UTL_REMOVE_DEFAULT_NSOBJECT_INITIALIZERS + (instancetype)new NS_UNAVAILABLE;\
- (instancetype)init NS_UNAVAILABLE;

#define UTL_REMOVE_DEFAULT_UIVIEWCONTROLLER_INITIALIZERS + (instancetype)new NS_UNAVAILABLE;\
- (instancetype)init NS_UNAVAILABLE;\
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;\
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;

#define UTL_REMOVE_DEFAULT_UIVIEW_INITIALIZERS + (instancetype)new NS_UNAVAILABLE;\
- (instancetype)init NS_UNAVAILABLE;\
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;\
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

#define guard(condition) if(condition) {}

#endif /* UTLMacros_h */
