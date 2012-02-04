# Maintainer: enzzzzy <enzzzzy ta gmail dot com>
pkgname=despan
pkgver=1.0
pkgrel=1
pkgdesc="Making SPAN port captures more useful"
arch=('i686' 'x86_64')
url="http://myoss.belgoline.com/despan"
license=('GPL')
depends=('gcc-libs' 'libpcap')
source=(http://myoss.belgoline.com/despan/despan_v1.0.tar.gz)
md5sums=('d488a555fd84fe449e209836e3743a84') 
build() {
  cd "$srcdir/$pkgname"
  make
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
