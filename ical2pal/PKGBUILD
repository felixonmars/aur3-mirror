# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

pkgname=ical2pal
pkgver=0.4.3
pkgrel=1
pkgdesc="Converter from ICAL format to PAL format"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/palcal/"
license=('GPL')
makedepends=('make' 'libical')
source=(http://downloads.sourceforge.net/project/palcal/pal/${pkgver}/pal-${pkgver}.tgz)
sha256sums=('ce470cb7be76522ff58cd0325ad7817b6cc2132a5e0cea55de8c9eb63b54551c')

build() {
   cd "$srcdir/pal-$pkgver/src/convert"

   mkdir -p $pkgdir/usr/bin

   make ical2pal || return 1
   cp ical2pal $pkgdir/usr/bin
}
