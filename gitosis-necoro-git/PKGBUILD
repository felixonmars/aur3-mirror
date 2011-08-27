# Forked from the gitosis-git of Alper KANAT <alperkanat@raptiye.org>
# Mantainer: Luca Cesari <mirshann@freakmind.org>

pkgname=gitosis-necoro-git
pkgver=20110506
pkgrel=1
pkgdesc="An application to help make hosting git repos easier and safer (Gentoo fork)"
url="http://github.com/Necoro/gitosis"
arch=('any')
license=('GPL2')
makedepends=("git" "python2" "python2-distribute")
conflicts=('gitosis' 'gitosis-git')
provides=('gitosis')
install=("gitosis.install")
source=()
md5sums=()

_gitroot="https://github.com/Necoro/gitosis.git"
_gitname="gitosis"

build() {
	cd ${srcdir}
	msg "Connecting to git server..."

	if [ -d ${srcdir}/${_gitname} ]; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	
    msg "Running setup.py ..."
	cd ${srcdir}/${_gitname}
	python2 setup.py build || return 1
	python2 setup.py install --root=${pkgdir} || return 1

	# license
	install -Dm644 "${srcdir}/${_gitname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	
	# example configs
	install -Dm644 "${srcdir}/${_gitname}/README.rst" "${pkgdir}/usr/share/doc/${_gitname}/README.rst"
	install -Dm644 "${srcdir}/${_gitname}/example.conf" "${pkgdir}/usr/share/doc/${_gitname}/example.conf"
	install -Dm644 "${srcdir}/${_gitname}/gitweb.conf" "${pkgdir}/usr/share/doc/${_gitname}/gitweb.conf"
	install -Dm644 "${srcdir}/${_gitname}/lighttpd-gitweb.conf" "${pkgdir}/usr/share/doc/${_gitname}/lighttpd-gitweb.conf"
}
