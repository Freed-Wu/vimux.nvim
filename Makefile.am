# Obvious program stuff.
lib_LTLIBRARIES=libvimux.la
CLEANFILES = src/tmux.1.mdoc src/tmux.1.man src/cmd-parse.c

# Distribution tarball options.
EXTRA_DIST = \
	src/CHANGES src/README src/README.ja src/COPYING src/example_tmux.conf \
	src/osdep-*.c src/mdoc2man.awk src/tmux.1
dist_EXTRA_libvimux_la_SOURCES = src/compat/*.[ch]

# Preprocessor flags.
AM_CPPFLAGS += @XOPEN_DEFINES@ \
	-DTMUX_VERSION='"@VERSION@"' \
	-DTMUX_CONF='"$(sysconfdir)/tmux.conf:~/.tmux.conf:$$XDG_CONFIG_HOME/src/tmux.conf:~/.config/src/tmux.conf"' \
	-DTMUX_LOCK_CMD='"@DEFAULT_LOCK_CMD@"' \
	-DTMUX_TERM='"@DEFAULT_TERM@"'

# Additional object files.
libvimux_la_LIBADD = $(LIBOBJS)

AM_CFLAGS += -Isrc
# Set flags for gcc.
if IS_GCC
AM_CFLAGS += -std=gnu99 -O2
if IS_DEBUG
AM_CFLAGS += -g
AM_CFLAGS += -Wno-long-long -Wall -W -Wformat=2
AM_CFLAGS += -Wmissing-prototypes -Wstrict-prototypes -Wmissing-declarations
AM_CFLAGS += -Wwrite-strings -Wshadow -Wpointer-arith -Wsign-compare
AM_CFLAGS += -Wundef -Wbad-function-cast -Winline -Wcast-align
AM_CFLAGS += -Wdeclaration-after-statement -Wno-pointer-sign -Wno-attributes
AM_CFLAGS += -Wno-unused-result -Wno-format-y2k
if IS_DARWIN
AM_CFLAGS += -Wno-deprecated-declarations -Wno-cast-align
endif
AM_CPPFLAGS += -DDEBUG
endif
AM_CPPFLAGS += -iquote.
endif

# Set flags for Solaris.
if IS_SUNOS
if IS_GCC
AM_CPPFLAGS += -D_XPG6
else
AM_CPPFLAGS += -D_XPG4_2
endif
endif

# Set flags for Sun CC.
if IS_SUNCC
AM_CFLAGS += -erroff=E_EMPTY_DECLARATION
endif

# Set _LINUX_SOURCE_COMPAT for AIX for malloc(0).
if IS_AIX
AM_CPPFLAGS += -D_LINUX_SOURCE_COMPAT=1
endif

# Set flags for NetBSD.
if IS_NETBSD
AM_CPPFLAGS += -D_OPENBSD_SOURCE
endif

# Set flags for Haiku.
if IS_HAIKU
AM_CPPFLAGS += -D_BSD_SOURCE
endif

# List of sources.
dist_libvimux_la_SOURCES = \
	src/alerts.c \
	src/arguments.c \
	src/attributes.c \
	src/cfg.c \
	src/client.c \
	src/cmd-attach-session.c \
	src/cmd-bind-key.c \
	src/cmd-break-pane.c \
	src/cmd-capture-pane.c \
	src/cmd-choose-tree.c \
	src/cmd-command-prompt.c \
	src/cmd-confirm-before.c \
	src/cmd-copy-mode.c \
	src/cmd-detach-client.c \
	src/cmd-display-menu.c \
	src/cmd-display-message.c \
	src/cmd-display-panes.c \
	src/cmd-find-window.c \
	src/cmd-find.c \
	src/cmd-if-shell.c \
	src/cmd-join-pane.c \
	src/cmd-kill-pane.c \
	src/cmd-kill-server.c \
	src/cmd-kill-session.c \
	src/cmd-kill-window.c \
	src/cmd-list-buffers.c \
	src/cmd-list-clients.c \
	src/cmd-list-keys.c \
	src/cmd-list-panes.c \
	src/cmd-list-sessions.c \
	src/cmd-list-windows.c \
	src/cmd-load-buffer.c \
	src/cmd-lock-server.c \
	src/cmd-move-window.c \
	src/cmd-new-session.c \
	src/cmd-new-window.c \
	src/cmd-parse.y \
	src/cmd-paste-buffer.c \
	src/cmd-pipe-pane.c \
	src/cmd-queue.c \
	src/cmd-refresh-client.c \
	src/cmd-rename-session.c \
	src/cmd-rename-window.c \
	src/cmd-resize-pane.c \
	src/cmd-resize-window.c \
	src/cmd-respawn-pane.c \
	src/cmd-respawn-window.c \
	src/cmd-rotate-window.c \
	src/cmd-run-shell.c \
	src/cmd-save-buffer.c \
	src/cmd-select-layout.c \
	src/cmd-select-pane.c \
	src/cmd-select-window.c \
	src/cmd-send-keys.c \
	src/cmd-server-access.c \
	src/cmd-set-buffer.c \
	src/cmd-set-environment.c \
	src/cmd-set-option.c \
	src/cmd-show-environment.c \
	src/cmd-show-messages.c \
	src/cmd-show-options.c \
	src/cmd-show-prompt-history.c \
	src/cmd-source-file.c \
	src/cmd-split-window.c \
	src/cmd-swap-pane.c \
	src/cmd-swap-window.c \
	src/cmd-switch-client.c \
	src/cmd-unbind-key.c \
	src/cmd-wait-for.c \
	src/cmd.c \
	src/colour.c \
	src/compat.h \
	src/control-notify.c \
	src/control.c \
	src/environ.c \
	src/file.c \
	src/format.c \
	src/format-draw.c \
	src/grid-reader.c \
	src/grid-view.c \
	src/grid.c \
	src/hyperlinks.c \
	src/input-keys.c \
	src/input.c \
	src/job.c \
	src/key-bindings.c \
	src/key-string.c \
	src/layout-custom.c \
	src/layout-set.c \
	src/layout.c \
	src/log.c \
	src/menu.c \
	src/mode-tree.c \
	src/names.c \
	src/notify.c \
	src/options-table.c \
	src/options.c \
	src/paste.c \
	src/popup.c \
	src/proc.c \
	src/regsub.c \
	src/resize.c \
	src/screen-redraw.c \
	src/screen-write.c \
	src/screen.c \
	src/server-acl.c \
	src/server-client.c \
	src/server-fn.c \
	src/server.c \
	src/session.c \
	src/spawn.c \
	src/status.c \
	src/style.c \
	tmux.c \
	vimux.c \
	src/tmux.h \
	src/tmux-protocol.h \
	src/tty-acs.c \
	src/tty-features.c \
	src/tty-keys.c \
	src/tty-term.c \
	src/tty.c \
	src/utf8-combined.c \
	src/utf8.c \
	src/window-buffer.c \
	src/window-client.c \
	src/window-clock.c \
	src/window-copy.c \
	src/window-customize.c \
	src/window-tree.c \
	src/window.c \
	src/xmalloc.c \
	src/xmalloc.h
nodist_libvimux_la_SOURCES = src/osdep-@PLATFORM@.c

# Add compat file for forkpty.
if NEED_FORKPTY
nodist_libvimux_la_SOURCES += src/compat/forkpty-@PLATFORM@.c
endif

# Add compat file for systemd.
if HAVE_SYSTEMD
nodist_libvimux_la_SOURCES += src/compat/systemd.c
endif

# Add compat file for utf8proc.
if HAVE_UTF8PROC
nodist_libvimux_la_SOURCES += src/compat/utf8proc.c
endif

# Enable sixel support.
if ENABLE_SIXEL
dist_libvimux_la_SOURCES += src/image.c src/image-sixel.c
endif

if NEED_FUZZING
check_PROGRAMS = src/fuzz/input-fuzzer
fuzz_input_fuzzer_LDFLAGS = $(FUZZING_LIBS)
fuzz_input_fuzzer_LDADD = $(LDADD) $(libvimux_la_OBJECTS)
endif

# Install tmux.1 in the right format.
install-exec-hook:
	if test x@MANFORMAT@ = xmdoc; then \
		sed -e "s|@SYSCONFDIR@|$(sysconfdir)|g" $(srcdir)/tmux.1 \
			>$(srcdir)/tmux.1.mdoc; \
	else \
		sed -e "s|@SYSCONFDIR@|$(sysconfdir)|g" $(srcdir)/tmux.1| \
			$(AWK) -f $(srcdir)/mdoc2man.awk >$(srcdir)/tmux.1.man; \
	fi
	$(mkdir_p) $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) $(srcdir)/tmux.1.@MANFORMAT@ \
		$(DESTDIR)$(mandir)/man1/tmux.1
