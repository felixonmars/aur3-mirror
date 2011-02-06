# Contributor: Brian Schubert <bewschubert@gmail.com>

pkgname=acgmake
pkgver=1.4
pkgrel=1
pkgdesc="A small tool used to compile C++ software projects distributed over several directory trees."
arch=('i386' 'x86_64')
url="http://www-i8.informatik.rwth-aachen.de/index.php?id=17"
license=('unknown')
source=(http://www-i8.informatik.rwth-aachen.de/fileadmin/download/software/acgmake/$pkgname-$pkgver.tgz
        acgmake-1.4-qt4.patch)
md5sums=('926719852ea35568dcd99116305645f2' '5d60974d2f8da0fc29e7e60d9387d64c')

build() {
	cd $srcdir/acgmake
  patch -p1 -i $startdir/acgmake-1.4-qt4.patch || return 1

  mkdir -p $pkgdir/opt $pkgdir/usr/bin
  cp -R $srcdir/acgmake $pkgdir/opt
	chmod 755 $pkgdir/opt/acgmake/bin/*
  ln -s /opt/acgmake/bin/acgmake $pkgdir/usr/bin
}

