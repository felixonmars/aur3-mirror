# webKam: Installer: Arch
# Contributor Enrico Risa <maggiolo00@gmail.com>

pkgname=webkam
pkgver=0.3.2
pkgrel=2
pkgdesc="A simple webcam application"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/webKam?content=76902"
license=('GPL')
depends=("qt" "qt4-qtruby" "gstreamer0.10-good-plugins")
makedepends=("cmake" "automoc4")

source=(http://${pkgname}-kde4.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
sha1sums=('f4b694a66cbb112d81abf16de88560d162b92d1d')

build() {
	cd "${srcdir}"

	# Build
	cmake ${pkgname}-${pkgver} || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1

	#  mv ${pkgdir}/usr/local/* ${startdir}/pkg/$KDEDIR
}

