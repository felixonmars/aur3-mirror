# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=qtbitcointrader-svn
_gitname=QtBitcoinTrader
pkgver=1.0707.r114.g2c1cf25
pkgrel=1
pkgdesc="Secure Multi Trading Client for Bitcoin"
arch=('x86_64' 'i686')
url="http://qtopentrader.com/"
license=('GPL3')
provides=('qtbitcointrader')
conflicts=('qtbitcointrader')
depends=('qt4')
makedepends=('qt4')
source=("git+https://github.com/JulyIGHOR/${_gitname}.git")
sha256sums=('SKIP')
install=qtbitcointrader.install

pkgver() {
   cd ${_gitname}
	# cutting off 'v' prefix in the git tag
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
   cd ${srcdir}/${_gitname}/src/
   qmake-qt4 QtBitcoinTrader_Desktop.pro -r PREFIX="/usr"
   make
}

package() {
   cd ${srcdir}/${_gitname}/src/
   make INSTALL_ROOT="${pkgdir}/" install
}

