# Author: Raul Gonzalez Duque <zootropo@gmail.com>
# Contributor: Xi0N <grayfox.i0n@gmail.com>
pkgname=rapidshare-dl
pkgver=0.3.6
pkgrel=1
pkgdesc="Download files from Rapidshare using a Premium Account (Command line)"
arch=(i686 x86_64 ppc)
url="http://mundogeek.net/rapidshare-dl/" 
license=(GPL)
depends=('python' 'wget') 
source=(https://edge.launchpad.net/%7Ezootropo/+archive/+files/${pkgname}_$pkgver-1.tar.gz)
md5sums=('020f9e22c17edad1807832857f1a642d')

build() { 
	cd "${startdir}/src/${pkgname}-${pkgver}/"
	make install DESTDIR=$pkgdir || return 1
}
