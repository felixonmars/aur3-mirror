# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Dany Martineau <dany.luc.martineau gmail com>

pkgname=gtkmorph
pkgver=20090926
pkgrel=3
pkgdesc="Loads, saves, warps, and dissolves images, and loads, saves, creates, and manipulates control meshes which determine the warping."
arch=('i686' 'x86_64')
url="http://xmorph.sourceforge.net/"
license=('GPLv2')
depends=('gtk2' 'imagemagick' 'netpbm')
source=(http://ftp.de.debian.org/debian/pool/main/x/xmorph/xmorph_${pkgver}.tar.gz ${pkgname}.desktop)
md5sums=('78ca98948be6433ffdbb324ea4071bef'
         '2857c3c2f0d8b9015f0cd46e39b0c6a7')

build() {
	cd "${srcdir}/xmorph-20090929"
	./configure --prefix=/usr --with-gtkmorph --without-xmorph
	make
}
package() {
	cd "${srcdir}/xmorph-20090929"
	mkdir -p ${pkgdir}/usr/share/applications
	cp ${srcdir}/gtkmorph.desktop ${pkgdir}/usr/share/applications
	make DESTDIR=${pkgdir} install 
}

# vim:set ts=2 sw=2 et:
