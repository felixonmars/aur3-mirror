# $Id$
# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>

pkgname=mview
pkgver=0.3.3
pkgrel=1
pkgdesc='Mesh Viewer - Easy to use lightweight application for displaying three dimensional models'
url='http://mview.sourceforge.net/'
license=('GPL')
depends=('qt')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/mview/$pkgname-src-$pkgver.tar.gz")
md5sums=('b0fdfb2f1ff3615f706c1b6465677c07')

build() {
  cd $srcdir/${pkgname}-${pkgver}

  make QTDIR=/usr
}

package() {
  #cd ${pkgname}-src-${pkgver}
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp $srcdir/${pkgname}-${pkgver}/mview $pkgdir/usr/bin
}
