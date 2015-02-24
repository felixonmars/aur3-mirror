# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=actionaz
pkgver=3.8.0
pkgrel=3
pkgdesc="A task automation tool"
arch=('i686' 'x86_64')
url="http://actionaz.org/"
license=('GPL3')
depends=('boost' 'opencv' 'qtmobility' 'libnotify')
install=actionaz.install
source=("https://github.com/Jmgr/actionaz/archive/v${pkgver}.tar.gz")

build() {
	cd "${srcdir}/actiona-${pkgver}"
	sed -i 's/\/local//' common.pri
	qmake-qt4
	make
}

package() {
	cd "${srcdir}/actiona-${pkgver}"
	make INSTALL_ROOT="${pkgdir}" install
}

md5sums=('30ebf5c7beba48dd1e471f6d9db6e12a')
