# Maintainer: Jonathan Lestrelin <zanko@daemontux.org>
# Contributor: Yonathan Dossow
# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>
pkgname=xspice
_pkgname=xf86-video-qxl
pkgver=0.0.16
pkgrel=2
pkgdesc="An X server that can be accessed by a Spice client"
arch=(x86_64 i686)
url="http://www.x.org"
license=('MIT')
groups=(xorg-video-drivers)
depends=(spice libsasl)
makedepends=(pkgconfig xorg-server-devel)
source=(http://xorg.freedesktop.org/releases/individual/driver/$_pkgname-$pkgver.tar.bz2)
md5sums=('21108fae53c14eb2c65413b55a3c8778')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sed -i -e "s#/usr/bin/python#/usr/bin/python2#g" scripts/xspice
  ./configure --prefix=/usr --disable-static --enable-xspice=only
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p "$pkgdir/etc/X11"
  cp examples/spiceqxl.xorg.conf.example "$pkgdir/etc/X11/spiceqxl.xorg.conf"
  make DESTDIR="$pkgdir/" INSTALL='install -p' install
}
