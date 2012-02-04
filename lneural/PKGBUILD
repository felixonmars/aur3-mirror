# Contributor: Lucas Hermann Negri <kkndrox@gmail.com>

pkgname=lneural
pkgver=0.2.0
pkgrel=1
pkgdesc="Artificial neural network library in pure Lua"
arch=('any')
url="http://oproj.tuxfamily.org" 
depends=('lua>=5.1')
license=(LGPL)
source=("http://downloads.tuxfamily.org/oproj/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=("95d324e02fcd1dcecfc53886aafb7f2f")

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/lua/5.1/lneural
  cp *.lua $pkgdir/usr/share/lua/5.1/lneural
}
