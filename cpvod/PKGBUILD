# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

pkgname=cpvod
pkgver=0.7.5
pkgrel=3
pkgdesc="Canal Plus (Canal+, French TV) Video On Demand for Linux"
arch=('i686' 'x86_64')
url="http://www.hsyl20.fr/cpvod"
license=('GPL')
makedepends=()
depends=('ruby' 'wget' 'ruby-nokogiri' 'flvstreamer')
optdepends=('mplayer')
source=(http://www.hsyl20.fr/cpvod/$pkgname-$pkgver.tgz)
install="cpvod.install"
md5sums=('72bde3af07fc398aac328e9c01ea332e')

build() {
   cd "$srcdir/$pkgname-$pkgver"

   mkdir -p $pkgdir/usr/bin
   mkdir -p $pkgdir/usr/share/doc/cpvod
   mkdir -p $pkgdir/usr/share/licenses/cpvod

   install cpvod $pkgdir/usr/bin/cpvod
   install -m 644 README $pkgdir/usr/share/doc/cpvod/
   install -m 644 LICENSE $pkgdir/usr/share/licenses/cpvod/
}
