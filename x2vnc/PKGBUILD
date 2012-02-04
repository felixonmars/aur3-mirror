# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: simo <simo@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=x2vnc
pkgver=1.7.2
pkgrel=3
pkgdesc="Lets you use two monitors on two different computers as if they were connected to the same computer."
arch=('i686' 'x86_64')
url="http://fredrik.hubbe.net/x2vnc.html"
license=('GPL')
depends=('libxinerama' 'libxss' 'libxrandr' 'libxxf86dga')
source=("http://fredrik.hubbe.net/x2vnc/$pkgname-$pkgver.tar.gz")
md5sums=('f23f86bcfa12a80eaeb886ab9b3ee447')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
	--prefix=/usr \
	--mandir=/usr/share/man

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir"/usr/{bin,share/man/man1}
  make DESTDIR="$pkgdir/" install
}
