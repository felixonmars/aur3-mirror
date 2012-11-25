# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=labelnation
pkgver=1.216
pkgrel=1
pkgdesc="A command-line label-printing program"
arch=('i686' 'x86_64')
url="http://www.red-bean.com/labelnation/"
license=('GPL')

source=(http://www.red-bean.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(6b5d1de4dcb0a7bf44c6f6cc5e4113d3)

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/labelnation/examples
  install -d $pkgdir/usr/bin
  install examples/* $pkgdir/usr/share/labelnation/examples/
  
  sed -e 's/env python/env python2/' labelnation > labelnation2
  sed -e 's/env python/env python2/' csv_to_ln > csv_to_ln2

  install -m755 labelnation2 $pkgdir/usr/bin/labelnation
  install -m755 csv_to_ln2 $pkgdir/usr/bin/csv_to_ln
}

