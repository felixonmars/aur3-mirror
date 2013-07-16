# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Florian Besser <fbesser@gmail.com>

pkgname=mulk
pkgver=0.7.0
pkgrel=1
pkgdesc="Multi-connection command line tool to download Internet sites."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/mulk"
license=('GPL3')
depends=('curl' 'uriparser' 'tidyhtml' 'libmetalink')
makedepends=('libtool')
options=('!libtool')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ccda91051fe0fe08b7f499ac9bf3a4c9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}



