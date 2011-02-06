# Contributor: Proktor <proktor86@gmail.com>
pkgname=qmoorie
pkgver=1.0.3.2
pkgrel=1
pkgdesc="A GUI for moorie"
arch=(i686)
url="http://sharesource.org/project/qmoorie/"
license=('GPL')
depends=(moorie qt)
makedepends=()
provides=()
conflicts=()
source=(http://launchpadlibrarian.net/17045628/qmoorie_$pkgver.orig.tar.gz prefix.patch)
md5sums=('eb8ae4d6b92127fdc89ab8538b45b359'
         '9025b6802d85f3ca07920aa8f7a8d113')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i "$startdir/prefix.patch"
  
  qmake PREFIX=$pkgdir/usr
  make || return 1
  make install
}
