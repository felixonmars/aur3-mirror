#$Id$
# Maintainer: HuJifeng <hjf004@gmail.com>

pkgname=umdreader
pkgver=0.1.0
pkgrel=1
pkgdesc="A easy-to-use e-book reader for umd file which often used in mobile phones,written in Qt"
arch=('i686' 'x86_64')
url="https://github.com/hjf004/UmdReader"
license=('GPL2')
depends=('qt' 'zlib')
source=("https://github.com/downloads/hjf004/UmdReader/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('80dbda023ddb9e217c25fb0ded81011602048746')

build() {
	cd "${srcdir}/UmdReader"
		sed -i "s:/usr/local:/usr:g" UmdReader.pro
		qmake
		make
}

package() {
	cd "${srcdir}/UmdReader"

		make INSTALL_ROOT=$pkgdir install
}

