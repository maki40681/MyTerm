VERSION = 0.9

PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man
ICONPREFIX = $(PREFIX)/share/pixmaps
ICONNAME = st.png

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

PKG_CONFIG = pkg-config

INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2` \
       `$(PKG_CONFIG) --cflags harfbuzz`
LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft -lgd \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2` \
       `$(PKG_CONFIG) --libs harfbuzz`

STCPPFLAGS = -DVERSION=\"$(VERSION)\" -DICON=\"$(ICONPREFIX)/$(ICONNAME)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)
