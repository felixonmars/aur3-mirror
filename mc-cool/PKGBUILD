# Maintainer: Osetrov Alexander F. <osetrovaf@gmail.com>

pkgname=mc-cool
_pkgname=mc
pkgver=4.8.0
pkgrel=1
pkgdesc="Midnight Commander - a file manager. Are included VFS (smbfs, undelfs etc.)"
arch=('i686' 'x86_64')
url="http://www.ibiblio.org/mc/"
license=('GPL')
depends=('e2fsprogs' 'glib2' 'pcre' 'slang' 'gpm')
makedepends=('libxt' 'libx11')
optdepends=('p7zip: support for 7zip archives')
provides=('mc')
conflicts=('mc' 'mc-colorer' 'mc-git' 'mc-new' 'mc-stable')
replaces=('mc' 'mc-colorer' 'mc-git' 'mc-new' 'mc-stable')
options=('!emptydirs' '!makeflags')
source=("http://www.midnight-commander.org/downloads/${_pkgname}-${pkgver}.tar.bz2"
        mc-root.desktop
        mc.desktop
        midnight_commander.png)
md5sums=('592478c3edfa2ad64c8cd165b9bec446'
         'b87e78db4dfb591588379b59944a8e7b'
         '8a2c7bf50c83770b17682af19484aa94'
         '0c1e9ed58044ff42bffd25465bfc8dd9')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--mandir=/usr/share/man \
	--enable-vfs-smb \
	--enable-vfs-undelfs \
	--with-screen=slang \
	--with-x \
	--with-subshell \
	--with-pcre

	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	rm -f ${pkgdir}/usr/lib/${_pkgname}/extfs.d/u7z
	install -m755 -d ${pkgdir}/usr/share/{applications,pixmaps}
	install -m644 ${srcdir}/midnight_commander.png ${pkgdir}/usr/share/pixmaps/
	install -m644 ${srcdir}/mc.desktop ${pkgdir}/usr/share/applications/
	install -m644 ${srcdir}/mc-root.desktop ${pkgdir}/usr/share/applications/
}
