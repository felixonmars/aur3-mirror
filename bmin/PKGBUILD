# Maintainer: Nicolas Estibals <Nicolas.Estibals@gmail.com>
pkgname=bmin
pkgver=1.0.1
pkgrel=2
pkgdesc="Visualizer of Boolean minimization"
arch=('x86_64' 'i686')
url="http://code.google.com/p/bmin/"
license=('gpl3')
depends=('qt')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tgz)
md5sums=('3853575817647a8e117b24f3c1bebd71')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
