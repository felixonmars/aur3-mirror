# Contributor: William Rea <sillywilly@gmail.com>
pkgname=mod_musicindex
pkgver=1.0.1
pkgrel=1
pkgdesc="An apache module that allows displaying of directories containing music files"
url="http://www.parisc-linux.org/~varenet/musicindex"
depends=('apache' 'libmp4v2' 'libid3tag' 'flac' 'libmad' 'libvorbis')
makedepends=('gettext')
source=(http://www.parisc-linux.org/~varenet/musicindex/libapache-mod-musicindex_$pkgver.orig.tar.gz)
md5sums=('70feb617884858a626b8c8d8b76366a5')

build() {
  cd $startdir/src/libapache-mod-musicindex-$pkgver
  ./configure --prefix=/usr --enable-apache2
  make || return 1
  make DESTDIR=$startdir/pkg install
}
