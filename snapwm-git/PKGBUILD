#Maintained by stlarch <stlarchie@gmail.com>
pkgname=snapwm-git
pkgver=20120816
pkgrel=1
pkgdesc="Minimal, lightweight, dynamic tiling window manager."
url="https://github.com/moetunes/Nextwm"
license=('MIT')
depends=('libx11')
makedepends=('gcc' 'make' 'git')
arch=('i686' 'x86_64')
source=()
md5sums=()
options=(!libtool)
install="${pkgname}.install"

_gitroot="git://github.com/moetunes/Nextwm.git"
_gitname="Nextwm"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done."
	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "sample.rc.conf" "${pkgdir}/usr/share/${pkgname}/sample.rc.conf"
	install -Dm644 "sample.key.conf" "${pkgdir}/usr/share/${pkgname}/sample.key.conf"
	install -Dm644 "sample.apps.conf" "${pkgdir}/usr/share/${pkgname}/sample.apps.conf"
}

