# Author: Raul Gonzalez Duque <zootropo@gmail.com>
# Contributor: Xi0N <grayfox.i0n@gmail.com>
pkgname=megaupload-dl
pkgver=0.3.6
pkgrel=1
pkgdesc="Download files from Megaupload using a Premium Account (Command line)"
arch=(i686 x86_64 ppc)
url="http://mundogeek.net/megaupload-dl/" 
license=(GPL)
depends=('python' 'wget') 
source=(https://edge.launchpad.net/%7Ezootropo/+archive/ppa/+files/${pkgname}_$pkgver.tar.gz)
md5sums=('a10419736f971d4b09ac65a4da544e65')

build() { 
	cd "${startdir}/src/${pkgname}-${pkgver}/"
	make install DESTDIR=$pkgdir || return 1
}
