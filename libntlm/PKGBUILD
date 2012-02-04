#contributor: Robin Martinjak <rob@kingofnerds.net>
#contributor: darkbill
#contributor: twa022 <twa022 at gmail dot com>

pkgname=libntlm
pkgver=1.3
pkgrel=1
pkgdesc="a library that implement Microsoft's NTLM authentication"
arch=('i686' 'x86_64')
source=(http://www.nongnu.org/libntlm/releases/$pkgname-$pkgver.tar.gz)
url="http://www.nongnu.org/libntlm/"
license=('LGPL')
options=('!libtool')
md5sums=('fd2419e4d1b7b70244c56c285e2a37a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
} 

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
