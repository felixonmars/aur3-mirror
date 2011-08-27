# Maintainer: Mihail Strashun <m.strashun@gmail.com> aka Volfram
pkgname=libphobos2-bin
pkgver=2.052
pkgrel=1
pkgdesc="Runtime library & Standard language library for the D programming language"
arch=('i686' 'x86_64')
url="http://www.digitalmars.com/d/2.0/"
source=(http://ftp.digitalmars.com/dmd.$pkgver.zip)
license=('custom')
conflicts=('libtango')
provides=('libphobos2='$pkgver)
md5sums=('133e80a929eaeddc9fe8964bbfa4cc4f')


build() {
   mkdir -p $pkgdir/usr/include/d
   cd $srcdir/dmd2/src/phobos
   cp -Rf std $pkgdir/usr/include/d || return 1
   cp -Rf etc $pkgdir/usr/include/d || return 1
   cp -f {crc32,phobos,unittest}.d $pkgdir/usr/include/d || return 1

   mkdir -p $pkgdir/usr/include/d/druntime
   cd $srcdir/dmd2/src/druntime/
   cp -Rf import $pkgdir/usr/include/d/druntime || return 1

   install -Dm644 $srcdir/dmd2/linux/lib/libphobos2.a $pkgdir/usr/lib/libphobos2.a || return 1
   install -Dm644 $srcdir/dmd2/linux/lib/libdruntime.a $pkgdir/usr/lib/libdruntime.a || return 1

   install -Dm644 $srcdir/dmd2/src/phobos/phoboslicense.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE || return 1
}

