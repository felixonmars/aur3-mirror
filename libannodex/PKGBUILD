# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libannodex
pkgver=0.7.3
pkgrel=1
pkgdesc="A library to provide reading and writing of Annodex files and streams"
url="http://www.annodex.net/software/libannodex"
options=('NOLIBTOOL')
license="custom"
depends=('liboggz' 'libcmml' 'libsndfile')
source=(http://www.annodex.net/software/libannodex/download/libannodex-$pkgver.tar.gz \
	import_cmml.patch)
md5sums=('504cf036cf04512260006a986926177f' 'd75e57862ee8fbde00488abe5fbd271e')

build() {
  cd $startdir/src/libannodex-$pkgver
  patch -p1 -i ../import_cmml.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  mv doc/*.1 $startdir/pkg/usr/man/man1

  install -D COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
