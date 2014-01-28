# Contributor: markuman <markuman@gmail.com>

pkgname=routino
pkgver=2.6
pkgrel=1
pkgdesc="Routino is an application for finding a route between two points using the dataset of topographical information collected by openstreetmap"
arch=('i686' 'x86_64')
url="http://www.routino.org/download/"
license=('AGPL')
source=('http://www.routino.org/download/routino-2.6.tgz')
md5sums=('e2fe8c0bbae5c7c7664bb0ca120687d8')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  sed -i s/"prefix=\/usr\/local"/"prefix=\/usr"/ Makefile.conf
  make -j1

}

package() {

  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

}

