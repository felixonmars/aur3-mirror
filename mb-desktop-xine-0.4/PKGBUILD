# Contributor: William Rea <sillywilly@gmail.com>
pkgname=mb-desktop-xine
pkgver=0.4
pkgrel=1
pkgdesc="A matchbox-desktop plugin that allows you to browse and play movies and music"
depends=('xine-lib' 'libmatchbox' 'libpng')
url="http://projects.o-hand.com/matchbox"
source=(http://projects.o-hand.com/matchbox/sources/$pkgname/0.4/$pkgname-$pkgver.tar.gz)
md5sums=('c6efe5d94b0ccfb2d18fe07407a58271')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  find $startdir/pkg -name '*.la' -exec rm {} \;
}
