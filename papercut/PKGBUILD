# Contributor: Kesara Nanayakkara Rathnayake <kesara@bcs.org>

pkgname=papercut
pkgver=0.1.2
pkgrel=1
pkgdesc="Command line based Rock, Paper, Scissors game"
arch=('i686' 'x86_64')
url="http://code.google.com/p/koolkit/wiki/papercut"
license=('GPL')
source=(http://koolkit.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha1sums=('a659a9d0f6d54173654561d2493fdd5014aff769')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
