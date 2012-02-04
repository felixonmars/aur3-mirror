pkgname=xdg-utils-rox
pkgver=20091108
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks. (With ROX patch)"
arch=(any)
url="http://portland.freedesktop.org/"
depends=('bash')
conflicts=('xdg-utils' 'xdg-utils-git')
provides=('xdg-utils=1.0.2')
source=(rox.patch)
makedepends=('docbook-xsl' 'lynx' 'xmlto')
license=('MIT')
md5sums=('c64e39da5f2162a02654d9c431c08e3e')

_gitroot='http://git.archlinux.de/~pierre/xdg-utils.git'
_gitname='xdg-utils'

build() {
	cd ${srcdir}
	git clone "${_gitroot}" "${_gitname}"
	cd "${_gitname}"
	patch -Np1 -i ../rox.patch
	./configure --prefix=/usr --mandir=/usr/share/man || return 1
	cd scripts
	make scripts html man || return 1
	cd ..
	make || return 1
	make DESTDIR="${pkgdir}" install || return 1
	install -D -m644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
}
