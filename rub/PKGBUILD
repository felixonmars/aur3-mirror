# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=rub
pkgver=2.0.2
pkgrel=1
pkgdesc="An instant RSS notifier"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/${pkgname}/"
license=("Apache")
depends=()
makedepends=('make' 'qt')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}.tar.bz2)
noextract=()
sha1sums=('c84bc02caa79c44c54d92f32463ff27cdad1a80c')

build() {
	cd ${srcdir}/src

	qmake -recursive
	make
}

package() {
	cd ${srcdir}/build

	# Directories
	install -d ${pkgdir}/usr/share/${pkgname}/ ${pkgdir}/usr/bin/ "${pkgdir}"/usr/share/applications/
	
	# Application
	cp -r * ${pkgdir}/usr/share/${pkgname}/
	ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/
	
	# Desktop
	install -D ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D ${srcdir}/src/main/images/Feed-icon.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
}
