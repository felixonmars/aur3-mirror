# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=abGate
pkgname=abgate
pkgver=1.1.4
pkgrel=1
pkgdesc="LV2 Noise Gate plugin"
arch=(i686 x86_64)
url="http://abgate.sourceforge.net/"
license=('GPL')
groups=('lv2-plugins')
depends=('gtkmm')
makedepends=('lv2core' 'qt')
optdepends=('qt: for qt gui')
provides=('lv2-abgate=$pkgver')
conflicts=('lv2-abgate')
replaces=('lv2-abgate')
source=("http://downloads.sourceforge.net/project/$pkgname/abGate-source/abGate-$pkgver.tar.gz")
md5sums=('976d469a70ae3945f16502515bb4f78b')

build() {
  cd "$srcdir/abGate-$pkgver"
  make
  cd untitled-* && make
}

package() {
  cd "$srcdir/abGate-$pkgver"
  make DESTDIR="$pkgdir/" install

  # qt gui
  install -Dm755 untitled-*/untitled.so \
    "$pkgdir/usr/lib/lv2/abGate.lv2"
}

# vim:set ts=2 sw=2 et:
