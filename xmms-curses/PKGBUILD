# $Id: PKGBUILD,v 1.4 2006/07/20 21:29:48 andyrtr Exp $
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=xmms-curses
pkgver=0.2.2
pkgrel=2
pkgdesc="Control XMMS from a console"
arch=(i686 x86_64)
url="http://xmms-curses.sourceforge.net/"
license=('GPL')
depends=('xmms')
source=(http://dl.sourceforge.net/sourceforge/xmms-curses/$pkgname-$pkgver.tar.gz)
md5sums=('6c6d1443c046198444459876f61d2c94')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,man/man1}
  cp xmms-curses $startdir/pkg/usr/bin
  cp xmms-curses.1 $startdir/pkg/usr/man/man1
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
