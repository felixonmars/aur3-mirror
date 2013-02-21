# Maintainer: Hackerbunny

pkgname=live-f1
pkgver=0.2.11
pkgrel=1
pkgdesc="Linux client for viewing the live timing feed of official Formula-1 Web site."
url="http://launchpad.net/live-f1/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('neon>=0.24' 'krb5')
source=(http://launchpad.net/live-f1/0.2/$pkgver/+download/live-f1-$pkgver.tgz)
md5sums=('f8251707da8bc0368c9b949c1672135b')

build() {
  cd "$srcdir/live-f1_$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

