enum {
  kCFRunLoopRunFinished = 1,
  kCFRunLoopRunStopped = 2,
  kCFRunLoopRunTimedOut = 3,
  kCFRunLoopRunHandledSource = 4,
};

enum {
  kCFRunLoopDefaultMode = 0,
  kCFRunLoopCommonModes = 1,  
};

int CFRunLoopRunInMode(int mode, float seconds, int returnAfterSourceHandled);
typedef struct __CFRunLoop *CFRunLoopRef;