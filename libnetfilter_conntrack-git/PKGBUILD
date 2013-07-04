pkgname=libnetfilter_conntrack-git
pkgdesc="Netfilter conntrack userspace library"
pkgver=1.0.3.15.g1e4d020
pkgrel=1
url="http://www.netfilter.org/projects/libnetfilter_conntrack/index.html"
license=("GPL2")
options=('!libtool')
license=('GPL')
arch=('i686' 'x86_64')
depends=('libmnl' 'libnfnetlink')
makedepends=('git')
provides=('libnetfilter_conntrack')
conflicts=('libnetfilter_conntrack')

source=('git://git.netfilter.org/libnetfilter_conntrack.git')

pkgver() {
  cd libnetfilter_conntrack
  git describe | sed 's/^v//;s/-/./g' | cut -f2- -d .
}

build() {
  cd libnetfilter_conntrack
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-shared --with-pic
  make V=1
}

package() {
  cd libnetfilter_conntrack
  make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')
sha256sums=('SKIP')
