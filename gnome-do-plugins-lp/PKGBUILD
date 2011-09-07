# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Master_D <matze_holz@web.de>
pkgname=gnome-do-plugins-lp
_realname=gnome-do-plugins
pkgver=0.8.4
pkgrel=1
pkgdesc="Plugins for GNOME Do (latest LP-Version)"
arch=(i686 x86_64)
url="https://launchpad.net/~do-plugins"
license=('GPL3')
depends=('gnome-do-lp')
makedepends=('intltool' 'monodevelop')
provides=(${_realname})
conflicts=(${_realname})
options=('!makeflags')
source=(http://launchpad.net/do-plugins/trunk/$pkgver/+download/${_realname}-$pkgver.tar.gz)
md5sums=('092b51b27463dc2beee65779d95a0ff1')

build() {
  cd $srcdir/${_realname}-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/${_realname}-$pkgver
  make DESTDIR=$pkgdir install

  rm -rf $pkgdir/usr/lib/gnome-do/plugins/*.mdb
}