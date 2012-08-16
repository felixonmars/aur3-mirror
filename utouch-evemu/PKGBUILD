# Contributor: Nicolas Quiénot < niQo at aur >

### obsolete package: please use evemu instead ####



pkgname=utouch-evemu
_pkgname=evemu
pkgver=1.0.9.1
pkgrel=2
pkgdesc="Event Emulation for the uTouch Stack"
arch=(i686 x86_64)
url="https://launchpad.net/utouch-evemu"
license=(GPL)
depends=('glibc')
makedepends=()
source=(http://launchpad.net/$_pkgname/1.0.9/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
options=('!libtool')

build() {
  cd $srcdir/$_pkgname-$pkgver
	./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

md5sums=('510845d6516e43dc445297c78744b1f6')
