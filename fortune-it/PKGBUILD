# Contributor: Asma <drake_nt@yahoo.it"
pkgname=fortune-it
pkgver=1.99
pkgrel=1
pkgdesc="Italian language fortune text package."
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h')
url="http://www.fortune-it.net/"
license=('GPL')
depends=('fortune-mod>=1.99.1-5')
source=(http://www.fortune-it.net/download/$pkgname-$pkgver.tar.gz)
md5sums=('b395af4484a8101a3f92163ab8667d8b')

build() {
  cd "$srcdir"
  tar xvfz "$pkgname-$pkgver.tar.gz"
  cd "$pkgname-$pkgver/testi"
  for SINGOLOFILE in * ; do strfile $SINGOLOFILE ; done
  mkdir off
  mv *-o ./off
  mv *-o.dat ./off
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver/testi"
  mkdir -p "$pkgdir/usr/share/fortune/off"
  cp -r * "$pkgdir/usr/share/fortune/"
}
