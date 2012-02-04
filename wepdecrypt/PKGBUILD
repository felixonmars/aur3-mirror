# Maintainer: Max Roder <maxroder@web.de>
# Contributor: phloyd <phloyd@iki.fi>

pkgname=wepdecrypt
pkgver=0.8
pkgrel=5
pkgdesc="Enhanced version of WepAttack a tool for breaking 802.11 WEP keys"
url="http://wepdecrypt.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl' 'libpcap')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
backup=('etc/wepdecrypt.conf')
sha256sums=('1c7cef077af4c162df1724d9149a15c231bf6c771380bb5789e66fb03f92c381')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --disable-gui --with-destdir=$startdir/pkg/
	LDFLAGS=${LDFLAG/--as-needed} make || return 1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et: