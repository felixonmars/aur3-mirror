
pkgname=libqt4report
pkgver=1.0.0
rel=3
pkgrel=2
pkgdesc="A library based on Qt4 to edit reports built from XML files."
arch=('i686' 'x86_64')
url="http://qtidy.hjcms.de/"
license=('LGPL2')
depends=('qt4' 'log4cpp')
makedepends=('make' 'cmake')
source=(http://heanet.dl.sourceforge.net/project/$pkgname/$pkgname-$pkgver-beta$rel.tar.gz)
md5sums=('a7d87f6eeee7458a097c49e53df4f516')

build() {
  cd $srcdir/$pkgname-$pkgver-beta$rel
 ./configure --prefix=/usr --sysconfdir=/etc --datarootdir=$pkgdir/usr/share --includedir=$pkgdir/usr/include --libexecdir=$pkgdir/lib --libdir=$pkgdir/lib
  
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-beta$rel
  make DESTDIR="$pkgdir/" install
}