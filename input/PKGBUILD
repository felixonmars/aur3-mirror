# Contributor: noob <s999@kaliningrad.ru>
# Contributor: soul916 <soul916@hotmail.com>

pkgname=input
pkgver=20081014
pkgrel=1
pkgdesc="input event util"
arch=(i686)
url="http://bytesex.org"
license=('GPL')
provides=(input=${pkgver}-${pkgrel})
_prefix="-101501"
source=(http://dl.bytesex.org/cvs-snapshots/$pkgname-$pkgver$_prefix.tar.gz)
md5sums=('a6854dc5218301b67324b483d26f1bee')

build() {
  cd "$startdir/src/$pkgname"

  export prefix="/usr"
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
