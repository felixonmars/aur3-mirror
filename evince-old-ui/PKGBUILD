# Maintainer: Michael Sproul <mic[insert surname]@gmail.com>
pkgname=evince-old-ui
pkgver=3.6.1
pkgrel=4
pkgdesc="A simple document viewer, sans GNOME 3 user interface."
arch=('i686' 'x86_64')
url="http://projects.gnome.org/evince/"
license=('GPL2')
depends=(	'gtk3' 'libgxps' 'libspectre' 'gsfonts' 'poppler-glib' 'djvulibre'
		'gnome-icon-theme' 't1lib' 'libsecret' 'desktop-file-utils' 'dconf'
		'gsettings-desktop-schemas' 'libnautilus-extension' 'libgnome-keyring')
makedepends=(	'itstool' 'libnautilus-extension' 'texlive-bin' 'intltool'
		'gobject-introspection' 'docbook-xsl' 'python')
optdepends=(	'texlive-bin: DVI support'
		'gvfs: bookmark support and session saving'
		'p7zip: cbz and cb7 compressed comic books'
		'tar: cbt compressed comic books'
		'unrar: cbr compressed comic books')
provides=('evince')
conflicts=('evince')
install=evince.install
source=('https://git.gnome.org/browse/evince/snapshot/evince-3.6.1.tar.gz')
md5sums=('18cd330a81320a4fe0dd7b8a0fab7c7e')

build() {
	cd evince-3.6.1
	./autogen.sh 	--prefix=/usr		--sysconfdir=/etc \
			--localstatedir=/var	--libexecdir=/usr/lib/evince \
			--disable-static	--enable-shared \
			--enable-pdf		--enable-tiff \
			--enable-djvu		--enable-dvi \
			--enable-t1lib		--enable-comics \
			--disable-scrollkeeper	--disable-schemas-compile \
			--enable-introspection
	make
}

package() {
	cd evince-3.6.1
	make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}
