pkgname=libnfnetlink-git
pkgver=1.0.1.1.g97a3960
pkgrel=1
pkgdesc="low-level library for netfilter related kernel/userspace communication"
url="http://www.netfilter.org/projects/libnfnetlink/index.html"
license=('GPL2')
depends=('glibc')
options=('!libtool')
makedepends=('git')
provides=('libnfnetlink')
conflicts=('libnfnetlink')
arch=('i686' 'x86_64')
source=('git://git.netfilter.org/libnfnetlink.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd libnfnetlink
  git describe | sed 's/^v//;s/-/./g' | cut -f2- -d .
}

build() {
  cd libnfnetlink
  ./autogen.sh
  ./configure --prefix=/usr --disable-static --enable-shared --with-pic
  make V=1
}

package() {
  cd libnfnetlink
  make DESTDIR="$pkgdir/" install
}
