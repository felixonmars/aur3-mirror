# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=vsys
pkgver=1.0
pkgrel=1
pkgdesc="An alternative to Sudo"
arch=('i686' 'x86_64')
url="http://www.cs.princeton.edu/~sapanb/vsys/"
license=('unknown')
depends=('ocaml' 'inotify-tools')
source=('http://www.cs.princeton.edu/~sapanb/vsys/vsys-1.0.tar.gz')
md5sums=('b9fe9a46f14d4341b170760f826dce4d')


build() {
 cd $srcdir

 rm -rf $srcdir/build
 cp -ar $srcdir/$pkgname $srcdir/build
 cd $srcdir/build
 export CFLAGS=""
 make
}

package() {
 cd $srcdir/build
 mkdir -p $pkgdir/usr/bin
 mkdir -p $pkgdir/etc/init.d
 make INSTALL_DIR=$pkgdir install
}
