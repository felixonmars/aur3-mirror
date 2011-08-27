# Contributor: Fabio Falcinelli < fabio.falcinelli@gmail.com >

pkgname=symsolon-extra-data
pkgver=v1
pkgrel=1
pkgdesc="Astrology software insipred by the SYMBOLON deck. Additional files."
arch=('i686' 'x86_64')
groups=()
url="http://symsolon.sourceforge.net/"
license=('GPL')
depends=()
makedepends=()
conflicts=()
provides=()
source=(http://downloads.sourceforge.net/symsolon/$pkgname-$pkgver.zip)
md5sums=('493eac0bac4a5295ad1e904ce229963d')

build() {
   mkdir -p $pkgdir/usr
   cp -R $srcdir/symsolon/share	$pkgdir/usr	
}

