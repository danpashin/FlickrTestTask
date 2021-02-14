//
//  defines.h
//  FlickrTestTask
//
//  Created by Daniil on 14.02.2021.
//

#ifndef dispatch_main_sync_safe
#define dispatch_main_sync_safe(block)\
if (dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(dispatch_get_main_queue())) {\
    block();\
} else {\
    dispatch_sync(dispatch_get_main_queue(), block);\
}
#endif
