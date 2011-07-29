# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=afnix
pkgver=1.6.0
pkgrel=3
pkgdesc="A multi-threaded functional programming language"
arch=('i686')
url="http://www.afnix.org"
license=('custom')
depends=(ncurses gcc-libs)
source=(http://www.afnix.org/ftp/afnix-1-6-0/afnix-src-1-6-0.tgz COPYING)
md5sums=('4cd87bab48e7849d1d8e3d69d125d227' '3c39957915b1a369338c8efd9019c80d')

build() {
  cd $startdir/src/afnix-src-1-6-0
  ./cnf/bin/afnix-setup -o --prefix=$startdir/pkg/usr || exit 1
  make status || exit 1
  make || exit 1
  make ETCDIR=$startdir/pkg/etc/afnix install || exit 1
  cd $startdir/src/afnix-src-1-6-0/doc
  make || exit 1
  install -d  $startdir/pkg/usr/man/man7
  install xml/vol/vol-?/*.7 -t $startdir/pkg/usr/man/man7
  cd $startdir/src
  install -D COPYING $startdir/pkg/usr/share/licenses/afnix/COPYING
}
