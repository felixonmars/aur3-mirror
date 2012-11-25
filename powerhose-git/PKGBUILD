# Maintainer: Nicolas Stalder <nicolas.stalder@gmail.com>

pkgname=powerhose-git
pkgver=20121121
pkgrel=1
pkgdesc="Runs workers via zmq to perform any kind of task"
url="https://github.com/mozilla-services/powerhose"
arch=('any')
license=('MPL')
depends=("python2" "git" "python2-pyzmq" "python2-psutil" "python2-iowait" "circus-git")
provides=("powerhose")

_gitroot="https://github.com/mozilla-services/powerhose.git"
_gitname="powerhose"

build() {
	cd ${srcdir}
	msg "Connecting to powerhose git server..."

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
	#install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
