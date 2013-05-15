# Contributor: Leandro Costa <lokidarkeden@gmail.com>
# Maintainer: Abelardo Ricart <aricart@gmail.com>

pkgname=squidclamav
pkgver=6.10
pkgrel=1
pkgdesc='is an antivirus redirector for Squid proxy based on the Awards winnings ClamAv anti-virus toolkit.'

arch=('i686' 'x86_64')
provides=()
replaces=()
license=('GPL')
url='http://squidclamav.darold.net/'
depends=('squid' 'clamav' 'curl' 'c-icap')
makedepends=('gcc' 'make')
options=('')
backup=()
source=("http://downloads.sourceforge.net/project/squidclamav/squidclamav/${pkgver}/squidclamav-${pkgver}.tar.gz")
md5sums=('a26f3dccb425f046a8002befe242c2a1')

build() {
	cd ${srcdir}/squidclamav-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1;
	make || return 1;
}

package() {
	cd ${srcdir}/squidclamav-${pkgver}
	make install DESTDIR=${pkgdir} || return 1; 
}
