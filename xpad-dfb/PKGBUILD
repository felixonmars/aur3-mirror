# Maintainer: lks <lukas dot graetz at web dot de>

# based on abs/community/xpad/PKGBUILD
# $Id: PKGBUILD 60101 2011-12-05 05:18:09Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

PREFIX=/opt/gtk2-dfb
pkgname=xpad-dfb
_pkgname=xpad
pkgver=4.2
pkgrel=1
pkgdesc="Stickies-like notes program (with gtk2-dfb directfb support)"
arch=(i686 x86_64)
depends=('gtk2-dfb' 'libsm' 'librsvg')
makedepends=('intltool')
#conflicts=('xpad')
url="http://mterry.name/xpad/"
license=('GPL')
install=xpad.install
source=(http://launchpad.net/xpad/trunk/$pkgver/+download/xpad-$pkgver.tar.bz2
	xpad-gtk-2.20.patch)
md5sums=('85583f8f68ad61ec282ea1332fe76480'
         '6a3d2952b469d65ec333714991ba8284')

build() {
  cd $srcdir/$_pkgname-$pkgver
#  patch -p1 <$srcdir/xpad-gtk-2.20.patch
  # enable directfb
  sed -i 's|gtk+-2.0|gtk+-directfb-2.0|g' configure
  ./configure --prefix=$PREFIX
  /usr/bin/make
}
package() {
  cd $srcdir/$_pkgname-$pkgver
  /usr/bin/make DESTDIR=$pkgdir install
}
