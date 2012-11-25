# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=indicator-sound-gtk2
_pkgname=indicator-sound
pkgver=12.10.0.1
pkgrel=1
pkgdesc="Unified sound menu (GTK+ 2 library for Xfce/LXDE)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicators-gtk2"
license=('GPL')
depends=('indicator-sound' 'libindicator' 'libdbusmenu-gtk2' 'ido-gtk2')
makedepends=('intltool' 'vala')
options=('!libtool')
source=(https://launchpad.net/indicators-gtk2/$pkgname/i-s-$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('3915cbdd4371d8fc795bd771ffb59691')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make -C src DESTDIR="$pkgdir/" install-soundmenulibLTLIBRARIES
}
