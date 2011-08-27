# Maintainer: enzzzzy <enzzzzy ta gmail dot com>
pkgname=conchart
pkgver=0.2
pkgrel=3
pkgdesc="A tool to visualise the timing of a network connection"
arch=('i686' 'x86_64')
url="http://myoss.belgoline.com/conchart"
license=('GPL')
depends=('gcc-libs' 'libpcap' 'tclap')
source=(http://downloads.sourceforge.net/sourceforge/conchart/$pkgname-$pkgver.tar.gz)
md5sums=('9f0a047aacf53e27f83120d69ec31e8b') 
build() {
  cd "$srcdir/$pkgname"
  make
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
