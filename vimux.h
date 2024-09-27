#ifndef VIMUX_H
#define VIMUX_H 1
#include <sys/cdefs.h>
__BEGIN_DECLS

void init(int argc, const char **argv);
int tmux(int argc, const char **argv);

__END_DECLS
#endif /* vimux.h */
