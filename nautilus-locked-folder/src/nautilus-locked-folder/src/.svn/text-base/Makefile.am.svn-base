
INCLUDES =						\
	-DG_LOG_DOMAIN=\"Nautilus-Locked-Folder\"	\
	-DDATADIR=\"$(datadir)\"			\
	-DGNOMELOCALEDIR=\""$(datadir)/locale"\" 	\
	-I$(top_srcdir)					\
	-I$(top_builddir)				\
	$(WARN_CFLAGS)                                  \
	$(DISABLE_DEPRECATED_CFLAGS)			\
	$(NAUTILUS_CFLAGS) \
	-DGLADEDIR=\""$(gladedir)"\" 

# FIXME: get this from the .pc file
nautilus_extensiondir=$(libdir)/nautilus/extensions-1.0

nautilus_extension_LTLIBRARIES=libnautilus-locked-folder.la

libnautilus_locked_folder_la_SOURCES =     \
	encrypt.c 			\
	decrypt.c			\
	lockedfolder-extension.c 	\
	lockedfolder.h

AM_CPPFLAGS=-Wall

libnautilus_locked_folder_la_LDFLAGS = -module -avoid-version
libnautilus_locked_folder_la_LIBADD  = $(NAUTILUS_LIBS)



