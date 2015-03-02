# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=walcommander
_pkgname=WalCommander
pkgver=0.19.0
_pkgver=release-${pkgver}
pkgrel=1
pkgdesc="Multi-platform open source file manager (Windows, Linux, FreeBSD, OS X) mimicking the look-n-feel of Far Manager"
arch=('i686' 'x86_64')
url=http://wcm.linderdaum.com/
license=('GPL2')
depends=('libx11' 'libssh2' 'smbclient' 'freetype2')
source=("https://github.com/corporateshark/${pkgname}/archive/${_pkgver}.tar.gz")
sha1sums=('60411a2814e59b23db16df2fcb2f82710141d8a0')

build() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"
	make all
}

package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"
	make DESTDIR="${pkgdir}" install
}
