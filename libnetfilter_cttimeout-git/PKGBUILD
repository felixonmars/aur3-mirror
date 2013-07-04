pkgname=libnetfilter_cttimeout-git
pkgdesc="cttimeout: timeout policy tuning for Netfilter/conntrack"
pkgver=1.0.0.2.gb6947ed
pkgrel=1
url="http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_cttimeout.git;a=tree"
license=("GPL2")
options=('!libtool')
license=('GPL')
arch=('i686' 'x86_64')
depends=('libmnl')
makedepends=('git')
provides=('libnetfilter_cttimeout' 'libnetfilter_cttimeout-git')
conflicts=('libnetfilter_cttimeout')
source=('git://git.netfilter.org/libnetfilter_cttimeout.git')

pkgver() {
  cd libnetfilter_cttimeout
  git describe | sed 's/^v//;s/-/./g' | cut -f2- -d .
}

build() {
  cd libnetfilter_cttimeout
  autoreconf -fiv
  ./configure --prefix=/usr --disable-static --enable-shared --with-pic
  make V=1
}

package() {
  cd libnetfilter_cttimeout
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
sha256sums=('SKIP')
