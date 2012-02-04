# Contributor: StoMoX <info@stomox.de>

pkgname=pencilanimation
pkgver=0.9.7
pkgrel=2
pkgdesc="Animation/drawing software, that lets you create traditional hand-drawn animation using both bitmap and vector graphics. This is the clash-version which implements flash & AVI/OGG export."
url=("http://pencil-animation.org/" "http://geesas.sourceforge.net/clash/")
license=("GPL")
arch=("i686" "x86_64")
depends=("qt" "phonon" "ming")
source=("geesas-pencilanimation.tar.gz" "pencil.desktop")
md5sums=('2a1ba10e61a1e0d9381c5a86c657ece3'
         '5d01cfadf14213b7a9c7bcb3f2ef778c')

build() {
	cd ${srcdir}/pencilanimation
	qmake && make || return 1

}

package() {
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/lib
	# install -d ${pkgdir}/usr/share/pencil/plugins
	install -D -m644 pencil.desktop ${pkgdir}/usr/share/applications/pencil.desktop
	install -m755 ${srcdir}/pencilanimation/Clash ${pkgdir}/usr/bin/pencil
	# install -m644 ${_svnmod}-build/release/plugins/* ${pkgdir}/usr/share/pencil/plugins
	# install -m644 ${_svnmod}-build/release/libpencil_structure.so.1.0.0 ${pkgdir}/usr/lib
	install -D -m644 ${srcdir}/pencilanimation/icons/icon.png ${pkgdir}/usr/share/pixmaps/pencil.png
}

# vim: set noet ff=unix:
