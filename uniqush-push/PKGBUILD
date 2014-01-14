# Maintainer: Nicolas Quiénot < niQo at aur >

pkgname=uniqush-push
pkgver=1.5.1
pkgrel=1
pkgdesc="Uniqush is a free and open source software which provides a unified push service for server-side notification to apps on mobile devices."
arch=(x86_64)
url="http://uniqush.org/"
license=(Apache)
depends=('glibc' 'redis')
provides=()
conflicts=()
options=('!libtool')
source=("http://uniqush.org/downloads/"$pkgname"_"$pkgver"_x86_64.tar.gz")
md5sums=('381557001172ad768dbddef30671b6bc')


package() {
  cd "$srcdir/"$pkgname"_"$pkgver"_x86_64"

  mkdir -p $pkgdir/etc/uniqush
  cp uniqush-push.conf $pkgdir/etc/uniqush
  mkdir -p $pkgdir/usr/bin
  cp uniqush-push $pkgdir/usr/bin

}

