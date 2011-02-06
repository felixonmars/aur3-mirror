# Contributor: Jeremie Huchet <jeremie@lamah.info>
pkgname=funambol-client
pkgver=1.7.0
pkgrel=1
pkgdesc="Funambol C++ client API"
arch=('i686')
url="http://www.forge.funambol.com/"
license=('GPL3')
groups=('root')
depends=()
makedepends=(automake autoconf libtool unzip)
source=('http://download.forge.objectweb.org/sync4j/funambol-client-sdk-7.1.0.zip')
noextract=('funambol-client-sdk-7.1.0.zip')
md5sums=('b193fc4bf5ce1c5e0966970e83c296ca')

function build() {
	# see funambol INSTALL's file
	which curl-config || return 1 
	cd $srcdir
	unzip -X funambol-client-sdk-7.1.0.zip
	cd Funambol/sdk/cpp/build/autotools
	. autogen.sh || return 1
	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
