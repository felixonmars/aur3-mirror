# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=nss-myhostname
pkgver=0.3
pkgrel=1
pkgdesc="NSS plugin providing host name resolution for the locally configured system hostname"
arch=('i686' 'x86_64')
url="http://0pointer.de/lennart/projects/nss-myhostname/"
license=('LGPL2.1')
source=("http://0pointer.de/lennart/projects/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('d62b0daffa7d37bb1c94b3aa25c75a97e5cf0d47')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim: ts=2:sw=2:et
