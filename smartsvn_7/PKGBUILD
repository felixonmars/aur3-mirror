#Maintainer: Rene Peinthor <peinthor@gmail.com>
pkgname=smartsvn_7
pkgver=7.0.1.3
_pkgver=7_rc3
pkgrel=1
pkgdesc="A Subversion(SVN) GUI client written in Java for SVN 1.7 - Early Access build for svn 1.7 support"
arch=("any")
url="http://www.syntevo.com/smartsvn/index.html"
license=('custom')
depends=("java-runtime" "desktop-file-utils" "sh")
makedepends=("python" "tidyhtml")
provides=(smartsvn_7=$pkgver)
source=(smartsvn_7.desktop downloader.py)
install="smartsvn.install"
md5sums=(
'3bb42224fefa24af64d9cdf8d0559570'
'08c0959d0b3dd39a458c827b2de90b59'
)
smartsvnmd5sum='77cf516dc8b2cc69206a106238695d8c'

extracted="smartsvn-$_pkgver"

build() {
	cd "$srcdir"
	python3 downloader.py smartsvn-generic-${_pkgver}.tar.gz

	echo "${smartsvnmd5sum} *smartsvn-generic-${_pkgver}.tar.gz" | md5sum -c || error "md5sum doesn't match" | exit 1

	tar xzf smartsvn-generic-${_pkgver}.tar.gz
}

package() {
	cd "$srcdir"

	install -D -m644 "${extracted}"/license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
	mkdir -p "${pkgdir}"/opt
	mv "${extracted}" ${pkgdir}/opt/$pkgname || return 1

	install -D -m644 smartsvn_7.desktop "${pkgdir}"/usr/share/applications/smartsvn_7.desktop
}
