# Contributor: Lee.MaRS <leemars@gmail.com>
# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
pkgname=fuse-convmvfs
pkgver=0.2.6
pkgrel=1
pkgdesc='A userland file system to convert filename charset.'
arch=('i686' 'x86_64')
url='http://fuse-convmvfs.sourceforge.net'
license=('GPL')
depends=('fuse' 'gcc-libs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('46b0dd34f07ee24c3cffa691d0bd4f334818a338') 

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir/" install
}
