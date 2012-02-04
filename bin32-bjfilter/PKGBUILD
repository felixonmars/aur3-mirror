#Maintainer: Jakub Nawalaniec <pielgrzym@prymityw.pl>
pkgname=bin32-bjfilter
pkgver=2.5
pkgrel=1
pkgdesc="32bit port of filter program to use canon pixus ip3100/ip4100/ip8600 and pixma ip1000/ip1500"
arch=('x86_64')
url="http://mambo.kuhp.kyoto-u.ac.jp/~takushi/"
license=('GPL')
depends=('lib32-libpng' 'lib32-libtiff' 'lib32-libcnbj' 'pstocanonbj')
conflicts=('bjfilter-2.5')
source=(http://aur.kmicica.net/${pkgname}-${pkgver}-${pkgrel}.src.tar.gz)
md5sums=('a3495edd4fd65808c3ce431efced6ac6')

build() {
   cd $srcdir/${pkgname/bin32-/}-${pkgver}-${pkgrel}
   make DESTDIR=$startdir/pkg install
}
