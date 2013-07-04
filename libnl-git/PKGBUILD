pkgname=libnl-git
_pkgname=libnl
pkgver=3.2.22.10.g408a1b8
pkgrel=1
pkgdesc="Convenience library for kernel netlink sockets"
arch=('i686' 'x86_64')
url="http://www.infradead.org/~tgr/libnl/"
license=('LGPL2.1')
depends=('glibc')
makedepends=('git')
provides=('libnl')
conflicts=('libnl')
options=('!libtool')
backup=('etc/libnl/classid'
        'etc/libnl/pktloc')
source=('git://git.infradead.org/users/tgr/libnl.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe | sed "s/$_pkgname//" | sed 's/_/\./g' | sed 's/-/\./g'
}

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-shared --disable-static --with-pic \
    --sbindir=/usr/bin # --disable-cli
    make V=1
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
