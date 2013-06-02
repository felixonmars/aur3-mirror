#contributor: tantalum@online.de
pkgname=mdb-git
_gitname=mdb
pkgver=508.65faa5e
pkgrel=1
pkgdesc='OpenLDAP Lightning Memory-Mapped Database (MDB)'
arch=(any)
license=(custom)
makedepends=(git)
depends=()
source=("git://gitorious.org/mdb/mdb.git")
url=http://symas.com/mdb/
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname/libraries/liblmdb
  make
}

package() {
  cd $_gitname/libraries/liblmdb
  #make with DESTDIR seems not to work, so we install manually
  mkdir -p ${pkgdir}/usr/{bin,lib,include}
  cp mdb_stat mdb_copy ${pkgdir}/usr/bin
  cp liblmdb.a liblmdb.so ${pkgdir}/usr/lib
  cp lmdb.h ${pkgdir}/usr/include
}
