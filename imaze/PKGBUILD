# Maintainer: billycongo <billycongo@gmail.com>

pkgname=imaze
pkgver=1.4
pkgrel=2
pkgdesc="A 3D TCP/IP-network-game which is a Smiley shootout under X11/OpenMotif. "
url=http://home.tu-clausthal.de/student/iMaze/
license=('custom')
arch=('i686' 'x86_64' )
depends=('lesstif')
source=( http://home.tu-clausthal.de/student/iMaze/files/$pkgname-$pkgver.tar.gz )
md5sums=('359cd8e072bfd7e51acafc1f106b9ea0')

build() {
  cd $startdir/src/$pkgname-$pkgver/source
  patch -p1 <../../../imaze-1.4.dif  Makefile.in
  ./configure
  make || return 1
  make install
  cd $startdir/src/$pkgname-$pkgver/
  /bin/install -d -m 755 $startdir/pkg/usr/games/imaze
  /bin/install -s -m 755 imaze imazesrv ninja genlab xlabed imazestat $startdir/pkg/usr/games/imaze
  /bin/cp -a labs $startdir/pkg/usr/games/imaze
  /bin/cp -a sounds $startdir/pkg/usr/games/imaze
  /bin/install -d -m 755 $startdir/pkg/usr/man
  /bin/cp -a man6/ $startdir/pkg/usr/man

}

