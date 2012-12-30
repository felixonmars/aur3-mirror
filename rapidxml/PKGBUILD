# Maintainer	: Georgios Tsalikis 	<anaphaxeton somewhere near tsalikis and a net>
# Contributor	: Alexandre Bique 	<bique.alexandre@gmail.com>

pkgname=rapidxml
pkgver=1.13
pkgrel=2
pkgdesc="A fast C++ library for parsing XML."
arch=('i686' 'x86_64')
license=('boost')
url="http://rapidxml.sourceforge.net"
source=(http://heanet.dl.sourceforge.net/sourceforge/rapidxml/$pkgname-$pkgver.zip)
md5sums=('7b4b42c9331c90aded23bb55dc725d6a')


package() {

  cd $srcdir/$pkgname-$pkgver
  mkdir -p  $pkgdir/usr/include
  for file in *.hpp; do install -m 0644 "$file" $pkgdir/usr/include/ ; done
  mkdir -p $pkgdir/usr/share/doc/rapidxml
  install -m 0644 manual.html $pkgdir/usr/share/doc/rapidxml
  
}