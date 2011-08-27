# $Id: PKGBUILD 119545 2011-04-12 03:04:01Z eric $
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=mc-preserve-attrs
pkgver=4.7.5.2
pkgrel=1
pkgdesc="Midnight Commander is a text based filemanager/shell that emulates Norton Commander (always preserve attrs on remote fs) "
arch=('i686' 'x86_64')
url="http://www.ibiblio.org/mc/"
license=('GPL')
depends=('e2fsprogs' 'glib2' 'pcre' 'gpm' 'slang')
makedepends=('libxt' 'libx11')
optdepends=('p7zip: support for 7zip archives')
provides=('mcedit-pkgbuild-syntax')
conflicts=('mc-utf8' 'mc')
replaces=('mc-utf8' 'mc')
options=('!emptydirs' '!makeflags')
source=("http://www.midnight-commander.org/downloads/mc-${pkgver}.tar.bz2"
	filegui.c.diff )
md5sums=('bdae966244496cd4f6d282d80c9cf3c6'
	 'd9ab8f7239dd9c728edb522f7028a4ca')

build() {
	cd "${srcdir}/mc-${pkgver}"

	./configure \
	    --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
	    --enable-background --enable-charset --enable-largefile \
	    --with-edit --with-gpm-mouse --with-mmap --enable-vfs-smb \
	    --with-screen=slang --with-subshell --with-vfs --with-x \
	    --without-debug --without-gnome --without-included-gettext \
	    --libexecdir=/usr/lib

	make
}

package() {
	cd "${srcdir}/mc-${pkgver}"

	patch -p0 < ../filegui.c.diff
	make DESTDIR="${pkgdir}" install

	# Fix FS#15177
	sed 's|op_has_zipinfo = 0|op_has_zipinfo = 1|' \
		-i "${pkgdir}/usr/lib/mc/extfs.d/uzip"

	# Fix FS#18312
	rm "${pkgdir}/usr/lib/mc/extfs.d/u7z"

	sed 's#/usr/bin/env python#/usr/bin/python2#' \
		-i "${pkgdir}/usr/lib/mc/extfs.d/s3+"
}
