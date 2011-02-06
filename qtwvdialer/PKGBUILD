# $Id: PKGBUILD,v 1.3 2008/04/04 18:33:40 BaSh Exp $
# Maintainer: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>

pkgname=qtwvdialer
pkgver=0.4.4
pkgrel=2
pkgdesc="A simple graphical front-end to wvdial."
arch=('i686' 'x86_64')
url="http://www.mtoussaint.de/qtwvdialer.html"
license=('GPL')
depends=('wvdial' 'qt3')
source=(http://www.mtoussaint.de/$pkgname-$pkgver.tgz $pkgname.desktop)
md5sums=('34b46650bdefe353374d9ae1ac46d5a3' '1b16f3b3658777cbeef0361b5400f538')

build() {
  cd $startdir/src/QtWvDialer-$pkgver

  . /etc/profile.d/qt3.sh
  export PATH=$QTDIR/bin:$PATH
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++

  ./configure --prefix=/usr
  make || return 1

  install -D -m755 bin/qtwvdialer $startdir/pkg/usr/bin/qtwvdialer
  install -D -m644 $startdir/src/$pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
}
