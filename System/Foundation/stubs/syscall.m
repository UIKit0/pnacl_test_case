#include <stdlib.h>
#include <unistd.h>

#ifndef TARGET_OS_android
int arc4random(void) {
    static char seeded = 0;
    if (!seeded) {
        srand(time(0));
        seeded = 1;
    }
    return rand();
}

#warning kill not supported
void kill(void) {
}
#endif

#warning killpg not supported
int killpg(int pgrp, int sig) {
  return 0;
}

#warning sigaction not supported
int sigaction(int sig, const struct sigaction *act, struct sigaction *oact) {
  return 0;
}

#warning setsid not supported
pid_t setsid(void) {
  return -1;
}

#warning mprotect not supported
int mprotect(void *addr, size_t len, int prot) {
  return 0;
}

#ifdef __native_client__
#warning pagesize not supported
size_t getpagesize(void) {
  return 4096;
}
#endif

int sysctlbyname(const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen)
{
    if (strcmp(name, "hw.machine") == 0) {
        char *result = "iPad";
        if (oldp) {
            strcpy(oldp, result);
        }
        *oldlenp = strlen(result) + 1;
        return 0;
    }
    return -1;
}
