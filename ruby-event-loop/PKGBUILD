# Maintainer: Bjorn Lindeijer <bjorn@lindeijer.nl>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-event-loop
pkgver=0.3
pkgrel=1
pkgdesc="A simple and easy-to-use event loop for Ruby"
arch=('i686' 'x86_64')
url="http://www.brockman.se/software/ruby-event-loop/"
license=('GPL')
depends=('ruby')
source=(ftp://ftp.idaemons.org/pub/distfiles/event-loop-$pkgver.tar.gz)
md5sums=('1f899e5526ed112477e9c1ebd3d05a41')

build() {
  cd $startdir/src/event-loop-$pkgver
  mkdir -p $startdir/pkg/usr/lib/ruby/1.8/
  cp -Rv lib/event-loop* $startdir/pkg/usr/lib/ruby/1.8
}
