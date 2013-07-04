pkgname=libnetfilter_log-git
pkgver=1.0.1.4.g7529487
pkgrel=1
pkgdesc="Netfilter logging userspace library"
url="http://netfilter.org"
license=('GPL2')
depends=('libnfnetlink')
makedepends=('git')
provides=('libnetfilter_log')
conflicts=('libnetfilter_log')
arch=('i686' 'x86_64')
options=('!libtool')
source=('git://git.netfilter.org/libnetfilter_log.git')

pkgver() {
  cd libnetfilter_log
  git describe | sed 's/^v//;s/-/./g' | cut -f2- -d .
}

build() {
  cd libnetfilter_log
  ./autogen.sh
  ./configure --prefix=/usr \
	  --disable-static --enable-shared --disable-rpath --with-pic
  make V=1
}

package() {
  cd libnetfilter_log
  make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
sha256sums=('SKIP')
