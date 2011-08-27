# Contributor: Charles Lindsay <charles@chaoslizard.org>
pkgname=usmb
pkgver=20100212
pkgrel=2
pkgdesc="Mount SMB shares via fuse"
arch=('i686' 'x86_64')
url="http://www.ametros.net/code.html"
license=('GPL')
depends=('fuse' 'smbclient' 'heimdal' 'libldap' 'libxml2')
source=(
	"http://www.ametros.net/downloads/$pkgname-$pkgver.tar.gz"
	'makefile-destdir.patch'
)
md5sums=(
	'3e90560718711ea23f95494bf2f00ec4'
	'c52aea929c0c29d817af45abc4fee71c'
)

build() {
	cd ${pkgname}-${pkgver}
	patch -N -i ${startdir}/makefile-destdir.patch || return 1
	./configure --prefix=/usr || return 1
	make || return 1
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install
}

