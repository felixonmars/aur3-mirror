#contributor: Robin Martinjak <rob@kingofnerds.net>
#contributor: darkbill
#contributor: twa022 <twa022 at gmail dot com>

_pkgname=libntlm
pkgname=$_pkgname-update
pkgver=1.4
pkgrel=1
pkgdesc="a library that implement Microsoft's NTLM authentication"
arch=('i686' 'x86_64')
source=(http://www.nongnu.org/libntlm/releases/$_pkgname-$pkgver.tar.gz)
url="http://www.nongnu.org/libntlm/"
license=('LGPL')
options=('!libtool')
md5sums=('54793488450e9085c57e0d859ff3bc8c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
} 

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
