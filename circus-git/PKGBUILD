# Maintainer: Nicolas Stalder <nicolas.stalder@gmail.com>

pkgname=circus-git
pkgver=20121116
pkgrel=1
pkgdesc="A Process & Socket Manager"
url="http://docs.circus.io"
arch=('any')
license=('APL')
depends=("python2" "git" "python2-pyzmq" "python2-psutil" "python2-iowait")
provides=("circus")

_gitroot="https://github.com/mozilla-services/circus.git"
_gitname="circus"

build() {
	cd ${srcdir}
	msg "Connecting to circus git server..."

	if [ -d ${srcdir}/${_gitname} ]; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cd ${srcdir}/${_gitname}
	python2 setup.py build || return 1
	python2 setup.py install --root=${pkgdir} || return 1

	# license
	install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
