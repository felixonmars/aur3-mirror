# $Id$
# Maintainer: atheros <nexather@gmail.com>

pkgname=rcd-1.0.0
_realname=rcd
pkgver=1.0.0
pkgrel=1
pkgdesc="Query and execute rc.d services and actions"
arch=('i686' 'x86_64')
url="http://kawais.org.ua/atheros_public_html/"
license=('custom')
depends=()
options=()
source=("http://kawais.org.ua/atheros_public_html/rcd/${_realname}-${pkgver}.tar.gz")
md5sums=('68dd52ee416dc70e0a58120cf10dfcc5')
sha1sums=('42dd4e9cbfd084a17bf2602dae019eb5f8890c17')

build() {
	cd "${srcdir}"
}

package() {
	echo ${srcdir}
	echo ${pkgdir}
	install -Dm755 ${srcdir}/rcd/rcd ${pkgdir}/usr/bin/rcd
	install -Dm644 ${srcdir}/rcd/rcd.1 ${pkgdir}/usr/share/man/man1/rcd.1
	install -Dm644 ${srcdir}/rcd/LICENSE ${pkgdir}/usr/share/doc/rcd/LICENSE
	install -Dm644 ${srcdir}/rcd/README ${pkgdir}/usr/share/doc/rcd/README
}