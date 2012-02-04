# Maintainer: Jan Dlabal <dlabaljan at gmail dot com>
pkgname=hc
pkgver=6.0
pkgrel=1
pkgdesc="A calculator and grapher with a lot of options and abundant functions, and a small integrated programming language - CLI version"
arch=('i686' 'x86_64')
url="http://houbysoft.com/hc/"
license=('GPL3')
depends=('gd' 'mapm' 'glibc' 'plplot-svn' 'readline')
source=("http://houbysoft.com/download/$pkgname-$pkgver-src.tar.gz")
md5sums=('66ecfb2b41830592531b03e50886efa5')

build() {
  cd  $srcdir/$pkgname-$pkgver-src
  make || return 1
  install -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -D -m644 README "$pkgdir/usr/share/$pkgname/README"
  install -D -m644 LICENSE "$pkgdir/usr/share/$pkgname/LICENSE"
}
