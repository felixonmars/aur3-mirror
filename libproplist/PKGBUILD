# $Id: PKGBUILD,v 1.5 2006/05/24 18:34:15 notz Exp $
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libproplist
pkgver=0.10.1
pkgrel=3
pkgdesc="libPropList is a utility library used by GNOME, Window Maker, and other applications to store configuration information"
arch=('i686' 'x86_64')
license=('GPL2')
url="ftp://ftp.windowmaker.org/pub/libs/"
source=(http://ows.linux.tucows.com/files/gnome/dev/libPropList-$pkgver.tar.gz)
md5sums=('ff32a4edbf9d0861012b2f10fd302ad5')

build() {
  cd $startdir/src/libPropList-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
