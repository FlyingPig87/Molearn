//
//  MLLog.h
//  CityGuide
//
//  Created by COLD FRONT on 12-5-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef CityGuide_MLLog_h
#define CityGuide_MLLog_h

#pragma mark assert & log
// debug level
#define MLEnableAssert  (1 << 0L)
#define MLLogDebug      (1 << 1L)
#define MLLogInfo       (1 << 2L)
#define MLLogWarning    (1 << 3L)
#define MLLogError      (1 << 4L)
#define MLLogFatal      (1 << 5L)
// none & all
#define MLLogNone       0
#define MLLogRelease    (MLLogInfo | MLLogWarning | MLLogError | MLLogFatal)
#define MLLogALL        (MLEnableAssert | MLLogDebug | MLLogRelease)

// working option
#ifdef DEBUG
#define MLLog       (MLLogALL)
#else
#define MLLog       (MLLogALL)
#endif

// assert
#if defined (MLLog) && (MLLog & MLEnableAssert)
#define MLAssert(condition, ...)   NSAssert(condition, __VA_ARGS__)
#else
#define MLAssert(condition, ...)   ((void)0)
#endif

#if defined (MLLog) && (MLLog & MLEnableAssert)
#define MLCAssert(condition, ...)   NSCAssert(condition, __VA_ARGS__)
#else
#define MLCAssert(condition, ...)   ((void)0)
#endif

// debug
#if defined (MLLog) && (MLLog & MLLogDebug)
#define MLDebug(...)      NSLog(__VA_ARGS__)
#else
#define MLDebug(...)      ((void)0)
#endif

// info
#if defined (MLLog) && (MLLog & MLLogInfo)
#define MLInfo(...)      NSLog(__VA_ARGS__)
#else
#define MLInfo(...)      ((void)0)
#endif

// warning
#if defined (MLLog) && (MLLog & MLLogWarning)
#define MLWarning(...)      NSLog(__VA_ARGS__)
#else
#define MLWarning(...)      ((void)0)
#endif

// error
#if defined (MLLog) && (MLLog & MLLogError)
#define MLError(...)      NSLog(__VA_ARGS__)
#else
#define MLError(...)      ((void)0)
#endif

// fatal
#if defined (MLLog) && (MLLog & MLLogFatal)
#define MLFatal(...)      NSLog(__VA_ARGS__)
#else
#define MLFatal(...)      ((void)0)
#endif

#endif
