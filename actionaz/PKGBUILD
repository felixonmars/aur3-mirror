# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=actionaz
pkgver=3.7.0
pkgrel=1
pkgdesc="A task automation tool"
arch=('i686' 'x86_64')
url="http://actionaz.org/"
license=('GPL3')
depends=('boost' 'opencv' 'qtmobility' 'libnotify')
install=actionaz.install
source=("https://github.com/Jmgr/actionaz/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/actionaz-${pkgver}"
	sed -i 's/\/local//' common.pri
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/actionaz-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" install
}

md5sums=('4dd1420d74d5d7dfa5f155b30bff0e21')
