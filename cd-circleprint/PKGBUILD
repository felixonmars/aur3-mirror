# Contributor: Your Name <youremail@domain.com>
pkgname=cd-circleprint
pkgver=0.7.0
pkgrel=1
pkgdesc="Program to create cd-labels"
arch=('i686' 'x86_64')
url="http://cd-circle-print.sourceforge.net/"
license=('GPL2')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/cd-circle-print/cd-circleprint_$pkgver.tar.gz)
md5sums=('9e33fb7cd029bd7e4c37ed28c0cdbf7b')

build() {
  cd $srcdir/cd-circleprint_0.7.0
install -d $pkgdir/usr/bin
install -m755 perl/cd-label.pl $pkgdir/usr/bin/cd-label
  }

# vim:set ts=2 sw=2 et:

