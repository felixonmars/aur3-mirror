_pkgname=libnetfilter_acct
pkgname=libnetfilter_acct-git
pkgver=1.0.2.5.ge998be2
pkgrel=1
pkgdesc="Library for the extended Netfilter accounting infrastructure"
url="http://netfilter.org"
license=('LGPL2.1')
depends=('glibc' 'libmnl')
makedepends=('git')
provides=('libnetfilter_acct')
conflicts=('libnetfilter_acct')
arch=('i686' 'x86_64')
options=('!libtool')
source=('git://git.netfilter.org/libnetfilter_acct.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe | cut -f2- -d - | sed 's/-/./g'
}

build() {
  cd "$_pkgname"

  autoreconf -fiv
  ./configure --prefix=/usr \
	  --disable-static --enable-shared --with-pic
  make V=1
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
} 
