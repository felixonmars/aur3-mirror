# Maintainer: Daniel Wallace <daniel.wallace at gatech dot edu>
# Contributor: Nezmer <Nezmer@gmail.com>

pkgname=mdbtools-devel
_pkgname=mdbtools
pkgver=0.6pre1
pkgrel=1
pkgdesc="A set of libraries and utilities for reading Microsoft Access database (MDB) files."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mdbtools/"
license=('LGPL' 'GPL')
depends=('libgnomeui' 'libglade' 'unixodbc' 'sqlite3')
makedepends=('bison' 'flex')

options=('!libtool')
provides=('mdbtools')
conflicts=('mdbtools')
replaces=('mdbtools')
source=(
http://sourceforge.net/projects/$_pkgname/files/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.gz
mdb_backend-patch.diff)

build() {
  cd "$srcdir/"
  patch -p0 -i mdb_backend-patch.diff
  cd "$srcdir/$_pkgname-$pkgver"
  #./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}
package(){
  cd ""$srcdir/$_pkgname-$pkgver""
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
md5sums=('246e8f38b2a1af1bcff60ee0da59300b'
         '22ae3b61ffcd0d866fd632e79d7dbb1e')
