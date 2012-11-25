# Contributor Jay M. <jskier@gmail.com>

pkgname=dc3ddgui
pkgver=1.0
pkgrel=2
pkgdesc="A QT gui frontend for the dc3dd version of dd that includes a number of features useful for computer forensics"
url="http://sourceforge.net/projects/dc3dd/"
license=("GPL3")
depends=('dc3dd')
makedepends=('qt')
arch=('i686' 'x86_64')
source=(http://downloads.sf.net/sourceforge/dc3dd/$pkgname-$pkgver-beta.tar.gz)
md5sums=('2e7e6f5637b9746d57471166c2f03bc3')

build() {
  cd $srcdir/$pkgname-$pkgver-beta
  qmake
  make || return 1
  install -d $pkgdir/usr/bin
  install -m755 $srcdir/$pkgname-$pkgver-beta/dc3ddgui $pkgdir/usr/bin
  make DESTDIR=$pkgdir install || return 1
}
