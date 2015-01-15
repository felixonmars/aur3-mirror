# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=neformal
pkgver=4.3.1
pkgrel=3
pkgdesc="Neformal is a small Qt/Phonon-based player WITHOUT any playlist or collection support. It provides a useful file manager with the ability to play file by file."
arch=('i686' 'x86_64')
url="http://neformal.sourceforge.net/"
license=('GPL3')
depends=('phonon-qt4')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
        $pkgname.desktop)
md5sums=('b7a81dbb039daafa1d767de6b3cbc9f3'
         'b52c2b5c144befc66b909845ee046cd6')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  qmake-qt4
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  
  # Binary
  install -Dm755 bin/neformal $pkgdir/usr/bin/neformal

  # Desktop icon
  install -Dm644 icons/app.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
