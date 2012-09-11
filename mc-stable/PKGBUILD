# Contributer: Viliam Simovic <vilosim@gmail.com>

pkgname=mc-stable
pkgver=4.8.1.5
pkgrel=1
pkgdesc="Midnight Commander - a visual file manager, stable branch"
arch=('i686' 'x86_64')
url="https://www.midnight-commander.org"
license=('GPL')
depends=('e2fsprogs' 'glib2' 'pcre' 'slang')
optdepends=('p7zip: support for 7zip archives'
	'mtools: a+ extfs'
	'cdparanoia: audio extfs'
	'gawk: hp48+ extfs'
	'cdrkit: iso9660 extfs'
	'perl: needed by several extfs scripts'
	'python-boto: s3+ extfs'
	'python2-pytz: s3+ extfs'
	'p7zip: u7z extfs'
	'unace: uace extfs'
	'unarj: uarj extfs'
	'cabextract: ucab extfs'
	'unrar: urar extfs'
	'zip: uzip extfs')
conflicts=('mc' 'mc-utf8')
replaces=('mc' 'mc-utf8')
options=('!emptydirs' '!makeflags')
backup=('etc/mc/edit.indent.rc'
        'etc/mc/edit.spell.rc'
        'etc/mc/filehighlight.ini'
        'etc/mc/mcedit.menu'
        'etc/mc/mc.ext'
        'etc/mc/mc.keymap'
        'etc/mc/mc.menu'
        'etc/mc/sfs.ini')
source=("http://www.midnight-commander.org/downloads/mc-${pkgver}.tar.xz")

build() {
	cd ${srcdir}/mc-${pkgver}

	./configure \
		--prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
		--enable-background --enable-charset --enable-largefile \
		--with-edit --without-gpm-mouse --with-mmap --enable-vfs-smb \
		--with-screen=slang --with-subshell --with-vfs --without-x \
		--without-debug --without-gnome --without-included-gettext \
		--libexecdir=/usr/lib --disable-static

	make
}

package() {
	cd "${srcdir}/mc-${pkgver}"

	make DESTDIR="${pkgdir}" install

	# Fix FS#15177
	sed 's|op_has_zipinfo = 0|op_has_zipinfo = 1|' \
		-i "${pkgdir}/usr/lib/mc/extfs.d/uzip"

	sed 's#/usr/bin/env python#/usr/bin/python2#' \
		-i "${pkgdir}/usr/lib/mc/extfs.d/s3+"
}

md5sums=('63b075b20fecd682ad02a15af503ad62')
