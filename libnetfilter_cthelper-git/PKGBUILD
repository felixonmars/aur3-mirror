pkgname=libnetfilter_cthelper-git
pkgdesc="User-space infrastructure for connection tracking helpers"
pkgver=1.0.0.2.gc9753bf
pkgrel=1
url="http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_cthelper.git;a=tree"
license=("GPL2")
options=('!libtool')
license=('GPL')
arch=('i686' 'x86_64')
depends=('libmnl')
makedepends=('git')
provides=('libnetfilter_cthelper')
conflicts=('libnetfilter_cthelper')
source=('git://git.netfilter.org/libnetfilter_cthelper.git')

pkgver() {
  cd libnetfilter_cthelper
  git describe | sed 's/^v//;s/-/./g' | cut -f2- -d .
}

build() {
  cd libnetfilter_cthelper
  autoreconf -fiv
  ./configure --prefix=/usr --disable-static --enable-shared --with-pic
  make V=1
}

package() {
  cd libnetfilter_cthelper
  make DESTDIR="$pkgdir/" install
}

md5sums=('SKIP')
sha256sums=('SKIP')
