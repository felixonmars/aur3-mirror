# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=examinator
pkgver=0.2
pkgrel=1
pkgdesc="A tool to generate multiple choice questions for LaTeX"
arch=('i686' 'x86_64')
url="http://www.perihel.at/examinator/"
license="GPL"
depends=('glibc')
makedepends=('cmake')
source=("http://www.perihel.at/examinator/${pkgname}-${pkgver}.tar.gz")
md5sums=('497b0b90440807235d62bff1d890b16a')

build() {
	cd $srcdir/${pkgname}-${pkgver}
	cmake . -DCMAKE_INSTALL_PREFIX=/${pkgdir}/usr
	make install || return 1
}
