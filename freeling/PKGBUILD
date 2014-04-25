# Maintainer: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>
# Contributor: Giorgio Lando <patroclo7@gmail.com>

pkgname=freeling
pkgver=3.1
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="a developer-oriented library providing language analysis services"
license=("GPL" "CC-BY" "CC-BY-SA" "CC-BY-NC-SA" "LGPLLR" "WN")
depends=('icu'
         'boost-libs'
         'zlib')
url=(http://nlp.lsi.upc.edu/freeling/)
source=($pkgname-$pkgver.tar.gz::http://devel.cpl.upc.edu/$pkgname/downloads/32
        boost-system-in-automake.patch)
install=$pkgname.install

build() {
   cd $srcdir/$pkgname-$pkgver/src
   patch -p0 < $srcdir/boost-system-in-automake.patch

   cd $srcdir/$pkgname-$pkgver
   aclocal
   libtoolize --force
   autoconf
   automake -a

   ./configure --prefix=/usr
   make PREFIX=/usr
}

package() {
   cd $srcdir/$pkgname-$pkgver
   make PREFIX=/usr DESTDIR=$pkgdir install

   mv $pkgdir/usr/bin/analyze $pkgdir/usr/bin/fl_analyze

   mkdir -p $pkgdir/usr/share/licenses/freeling
   install -m644 COPYING	$pkgdir/usr/share/licenses/freeling/OVERVIEW
   install -m644 LICENSES/*	$pkgdir/usr/share/licenses/freeling
}

md5sums=('c11757e8519bfe51cbb7f57a4b1a06de'
         '3ad1440a778d0cb41c30f0ac4a638565')
