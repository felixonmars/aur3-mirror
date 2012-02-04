# Contributor: Jordy van Wolferen <jordz . archlinux.us>
# Maintainer: John Gerritse <reaphsharc@gmail.com>

pkgname=kboincspy
pkgver=0.9.1
pkgrel=3
pkgdesc="Monitor and control utility for the BOINC client"
url="http://kboincspy.sourceforge.net"
license=('GPL2')
depends=('kdelibs3' 'boinc')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/kboincspy/$pkgname-$pkgver.tar.bz2)
md5sums=('09943d36555686e51ed18d37bbe0dfe2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt --without-arts
  make || return 1
  make DESTDIR=$startdir/pkg install
}
