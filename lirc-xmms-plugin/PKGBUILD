# $Id: PKGBUILD,v 1.2 2006/12/27 16:24:23 Neverth Exp $
# Maintainer: Todd Musall <tmusall@comcast.net>
# Contributor: Todd Musall <tmusall@comcast.net>

pkgname=lirc-xmms-plugin
pkgver=1.4
pkgrel=1
pkgdesc="XMMS LIRC plugin"
arch=(i686 x86_64)
url="http://www.lirc.org"
license="GPL"
depends=('gtk' 'lirc')
source=(http://dl.sourceforge.net/sourceforge/lirc/$pkgname-$pkgver.tar.bz2)
md5sums=('d853ef236a67eef0d61749fca90a0990')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
