# Contributor: wido <widomaker2k7@gmail.com>

pkgname=perroquet
pkgver=1.1.1
_pkgver=1.1
pkgrel=1
pkgdesc="Perroquet is a educational program to improve playfully your listening in a foreign language"
arch=('i686' 'x86_64')
url="http://perroquet.b219.org"
license=('GPL3')
depends=('python2' 'gtk2' 'intltool>=0.40.0' 'pygtk' 'gstreamer0.10-good' 'gstreamer0.10-python')
makedepends=('gcc')
optdepends=('gstreamer0.10-plugins')
install=${pkgname}.install
source=(http://launchpad.net/perroquet/$_pkgver/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('af6ebfc9e57f74174e277e269b7a20b9')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python2 setup.py --without-icon-cache --without-mime-database --without-desktop-database install --root=${pkgdir}/
}
