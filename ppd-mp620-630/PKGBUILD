# Contributor: Olivier Duclos <olivier.duclos@gmail.com>

pkgname=ppd-mp620-630
pkgver=1.5
pkgrel=1
pkgdesc="Canon drivers for the MP620 and MP630 printer/scanner"
arch=('i686')
url="http://sourceforge.net/projects/mp610linux/"
license=('custom')
depends=('cups' 'popt' 'ghostscript' 'cnijfilter-common')
optdepends=('cups-bjnp: for wifi support')
install=mp620.install
source=(http://downloads.sourceforge.net/mp610linux/ppdMP620-630en-$pkgver.tar.gz)
md5sums=('4635702d2bade156030ebf45fec2de18')

build() {
  cd $srcdir/ppdMP620-630en-$pkgver
  install -d $pkgdir/usr/share/cups/model
  install canonmp620-630en.ppd $pkgdir/usr/share/cups/model/
  install -d $pkgdir/usr/lib/bjlib
  install cifmp610.conf $pkgdir/usr/lib/bjlib/
}
