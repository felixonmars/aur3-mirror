# $Id: PKGBUILD,v 1.10 2008/10/21 22:45:02 BaSh Exp $
# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=nautilus2-open-terminal
tarname=nautilus-open-terminal
pkgver=0.9
pkgrel=3
pkgdesc="A nautilus plugin for opening terminals in arbitrary local paths"
arch=('i686' 'x86_64')
url="http://manny.cluecoder.org/packages/nautilus-open-terminal"
license=('GPL')
depends=('nautilus2')
makedepends=('pkgconfig' 'intltool')
conflicts=('nautilus-open-terminal')
source=(ftp://ftp.gnome.org/pub/GNOME/sources/$tarname/$pkgver/${tarname}-${pkgver}.tar.gz
        https://launchpad.net/ubuntu/jaunty/+source/nautilus-open-terminal/0.9-3ubuntu1/+files/nautilus-open-terminal_0.9-3ubuntu1.diff.gz)

md5sums=('576e6d727ce758d1ac1748960d6897d1'
         '287fc259b3c0dca17a3f60be2121759e')

provides=('nautilus2-open-terminal')
options=('!libtool')

build() {
  cd "$srcdir/$tarname-$pkgver"

  patch -Np1 -i ../nautilus-open-terminal_0.9-3ubuntu1.diff || return 1

  patch -Np1 -i debian/patches/gio-port.diff || return 1
  patch -Np1 -i debian/patches/no-werror.diff || return 1
  ./configure --prefix=/usr

  #fix non-standard directory
  sed -i 's|${prefix}/etc|/etc|' Makefile

  make || return 1
  make DESTDIR="$pkgdir" install
}
