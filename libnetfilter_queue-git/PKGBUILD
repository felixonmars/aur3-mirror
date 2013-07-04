pkgname=libnetfilter_queue-git
pkgver=1.0.2.7.g84d2428
pkgrel=1
pkgdesc="Netfilter queue userspace library"
url="http://netfilter.org"
license=('GPL2')
depends=('libnfnetlink')
makedepends=('git')
provides=('libnetfilter_queue')
conflicts=('libnetfilter_queue')
arch=('i686' 'x86_64')
options=('!libtool')
source=('git://git.netfilter.org/libnetfilter_queue.git')

pkgver() {
  cd libnetfilter_queue
  git describe | sed 's/^v//;s/-/./g' | cut -f2- -d .
}

build() {
  cd libnetfilter_queue
  ./autogen.sh
  ./configure --prefix=/usr \
	  --disable-static --enable-shared --disable-rpath --with-pic
  make V=1
}

package() {
  cd libnetfilter_queue
  make DESTDIR="$pkgdir" install
} 

md5sums=('SKIP')
sha256sums=('SKIP')
