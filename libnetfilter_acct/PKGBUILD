# Maintainer: Alessandro Sagratini <ale_sagra@hotmail.com>
pkgname=libnetfilter_acct
pkgver=1.0.0
pkgrel=1
pkgdesc="Userspace library providing interface to extended accounting infrastructure."
arch=('i686' 'x86_64')
url="http://www.netfilter.org/projects/libnetfilter_acct/index.html"
license=('GPL')
depends=('libmnl' 'linux>=3.3')
options=(!libtool)
source=(http://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2)
md5sums=('246e97feb9cf98f7ddf70d71a3813336')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
