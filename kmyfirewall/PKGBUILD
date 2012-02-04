# $Id: PKGBUILD 13844 2008-09-29 03:16:22Z allan $
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>
# Maintainer : Lajos Kovacs <klajos at archlinux us>

pkgname=kmyfirewall
pkgver=1.1.1
pkgrel=1.1
pkgdesc="A (almost) complete graphical interface to the IPTables command line program that configures the fire walling functionality "
arch=(i686 x86_64)
url="http://kmyfirewall.sourceforge.net/"
license=('GPL')
depends=('kdelibs3' 'iptables')
source=(http://downloads.sourceforge.net/sourceforge/kmyfirewall/$pkgname-$pkgver.tar.bz2)
install=kmyfirewall.install

build() {
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde --enable-final --disable-debug --without-arts --with-qt-dir=/opt/qt
   make || return 1
   make DESTDIR=$startdir/pkg/ install
 }
md5sums=('707afe4bb8724148986fd80485f0da03')
