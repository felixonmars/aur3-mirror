# Author: Raul Gonzalez Duque <zootropo@gmail.com>
# Contributor: Xi0N <grayfox.i0n@gmail.com>
pkgname=nautilus-rename-exif-date
pkgver=0.1.1
pkgrel=1
pkgdesc="Adds an entry to Nautilus' contextual menu to rename photos to their EXIF date"
arch=(i686 x86_64 ppc)
install=(nautilus-rename-to-exif-date.install)
url="http://mundogeek.net/nautilus-scripts/#nautilus-rename-exif-date" 
license=(GPL)
depends=('python' 'python-nautilus' 'nautilus') 
source=(http://launchpadlibrarian.net/17362131/nautilus-rename-exif-date_$pkgver-$pkgrel.tar.gz)
md5sums=('9f0a69ac588ff32db78f5349b6622afe')

build() { 
	cd "${startdir}/src/${pkgname}-${pkgver}/"
	make install DESTDIR=$pkgdir || return 1
}
