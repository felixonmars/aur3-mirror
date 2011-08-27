# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Martin Brandenburg <brandemk@gmail.com>
# Contributor: Martin Brandenburg <brandemk@gmail.com>
pkgname=libcppircclient
pkgver=0.3.0r1
pkgrel=1
pkgdesc="C++ IRC Client Library"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/libcppircclient/"
license=('LGPL')
groups=('')
provides=('')
depends=('boost')
makedepends=('')
conflicts=('')
replaces=('')
backup=('')
install=('')
source=(http://downloads.sourceforge.net/libcppircclient/libcppircclient-r0.3.0r1.tar.bz2)
md5sums=('10616926f80762e40769f94f25d35978')

build() {
  cd $startdir/src/r$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
