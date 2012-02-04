# Contributor: Arun Chaganty <arunchaganty@gmail.com>
pkgname=bochs-dbg
pkgver=2.5
pkgrel=3
pkgdesc="A portable x86 PC emulation software package"
arch=(i686 x86_64)
url="http://bochs.sourceforge.net/"
license=('LGPL')
depends=(gcc-libs libxpm wxgtk)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://biznetnetworks.dl.sourceforge.net/project/bochs/bochs/$pkgver/bochs-$pkgver.tar.gz)
noextract=()
md5sums=('f34ccb756a38c3d5ecf9e3390687967b')

build() {
  cd $startdir/src/bochs-$pkgver
  ./configure --prefix=/opt/$pkgname --enable-plugins --enable-cpu-level=6 --enable-wx --enable-debugger
  make || return 1
  make DESTDIR=$startdir/pkg install

  # Create convenient link
  cd $startdir/pkg 
  mkdir usr
  mkdir usr/bin
  ln -s opt/$pkgname/bin/bochs usr/bin/$pkgname 

}
