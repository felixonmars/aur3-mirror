# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=lua-datafilter
pkgver=1.1
pkgrel=1
pkgdesc='Library to process data using various algorithms in Lua'
arch=('i686' 'x86_64')
url='http://www.geoffrichards.co.uk/lua/datafilter/'
license=('MIT')
depends=('lua')
source=("http://www.geoffrichards.co.uk/lua/datafilter/download/$pkgname-$pkgver.tar.gz")
md5sums=('068e078c32c80b27405f2d1afeb95500')

build() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=$pkgdir/usr install
  install -Dm0644 COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
