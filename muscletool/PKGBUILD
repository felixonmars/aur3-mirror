# Contributor: Christoph Drexler <chrdr at gmx dot at>
pkgname=muscletool
pkgver=2.1.1
pkgrel=1
pkgdesc="A command line tool for MuscleCard enabled smartcards"
arch=('i686' 'x86_64')
url="https://alioth.debian.org/projects/muscleapps"
license="BSD"
depends=('libmusclecard' 'readline')
#https://alioth.debian.org/frs/download.php/3180/muscletool-2.1.1.tar.bz2
source=(https://alioth.debian.org/download.php/3180/muscletool-$pkgver.tar.gz)
md5sums=('262040198294075274418688c73c2538')

build() {
  cd $startdir/src/muscletool-$pkgver
  ./configure --prefix=/usr --enable-readline
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
