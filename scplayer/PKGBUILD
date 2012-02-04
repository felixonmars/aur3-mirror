# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=scplayer
pkgver=0.0.2
pkgrel=1
pkgdesc='GUI front-end to p2p TV sopcast'
arch=('i686' 'x86_64')
url='http://code.google.com/p/scplayer/'
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'sopcast')
makedepends=('gettext')
options=('!makeflags')
[ "$CARCH" == "x86_64" ] && depends=('bin32-sopcast' 'gtk3' 'hicolor-icon-theme')
source=("http://scplayer.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('cacda8db72bb5a8bfbad3d0d7e8fb31c')

build() {
  cd $srcdir

  # Build
  make
  mkdir -p $pkgdir/usr/bin
  chmod a+x scplayer scplayer.$pkgver
  cp -d scplayer scplayer.$pkgver $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/applications
  cp -d scplayer.desktop $pkgdir/usr/share/applications
}
