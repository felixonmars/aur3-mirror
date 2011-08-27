# Contributor: payalkin <imsnet@yandex.ru>
pkgname=cdfly
pkgver=0.3
pkgrel=1
pkgdesc="CdFly is a crossplatform CD collection manager"
arch=('i686' 'x86_64')
url="http://cdfly.sourceforge.net/page/Main_Page"
license=('GPL')
depends=(qt)
makedepends=(qt)
source=(http://mesh.dl.sourceforge.net/sourceforge/cdfly/$pkgname-$pkgver.zip)
md5sums=('d460a16d8d2563f419c7d81a176acfec')

build() {
   cd "$srcdir/$pkgname"
 
  qmake
  make || return 1
  install -D -m755 $srcdir/$pkgname/cdfly $pkgdir/usr/bin/cdfly

  lrelease $srcdir/$pkgname/cdfly.pro
  install -d $pkgdir/usr/share/cdfly/
  install -D -m644 $srcdir/$pkgname/*.qm $pkgdir/usr/share/cdfly/

}

