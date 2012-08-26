# Maintainer: William Robson <logiblocs at gmail dot com>
# Contributer: Erwann Traourouder <erwann dot traourouder at gmail dot com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgname=gcp
pkgver=0.1.3
pkgrel=2
pkgdesc='copy tool (like cp) with advanced functionalities'
arch=('any')
url='http://www.goffi.org/'
license=('GPL')
depends=('python2' 'python2-progressbar')
source=("ftp://ftp.goffi.org/gcp/$pkgname-$pkgver.tar.bz2")
md5sums=('146da3e5508be6273b0a9169326286f2')

build() {
  sed -i 's|^#!/usr/bin/python$|#!/usr/bin/python2|' $srcdir/$pkgname-$pkgver/gcp
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  mv -v $pkgdir/usr/share/doc/$pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/
}
