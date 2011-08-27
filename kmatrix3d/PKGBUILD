# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Previous Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Previous Contributor: andrew9888 <xiner@centrum.cz>
# Previous Contributor: virhilo <virhilo@gmail.com>
pkgname=kmatrix3d
pkgver=0.1
pkgrel=5
pkgdesc="OpenGL screensaver for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kmatrix3d.sourceforge.net/"
depends=('kdelibs' 'glut' 'qt3')
makedepends=('automake')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('18bfaecbdbb521a8a840e8bd80a70729')
build() {
  cd "$srcdir/$pkgname"
  . /etc/profile.d/qt3.sh
  export PATH=$QTDIR/bin:$PATH
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++
  ./configure --prefix=/opt/kde || return 1
  sed -i "s|aclocal-1.9|aclocal-1.10|" Makefile
  sed -i "s|automake-1.9|automake-1.10|" Makefile
  make || return 1
  make prefix="$pkgdir/opt/kde" install
}
