# Maintainer: Jove Yu < yushijun110[AT]gmail.com >

pkgname=sae-dev-server
pkgver=1.3.2
pkgrel=1
pkgdesc="SAE Python development server - experimental"
arch=('i686' 'x86_64')
url="https://github.com/SAEPython/saepythondevguide"
license=('GPL')
depends=('python2' 'python2-werkzeug' 'python2-pip' 'python2-yaml')
source=()

_gitroot="https://github.com/SAEPython/saepythondevguide"
_gitname="saepythondevguide"
_gitbranch="master"


build() {
	cd "${srcdir}"

	msg "Connecting to GitHub..."

	if [ -d "${srcdir}/${_gitname}" ]; then
		cd "${_gitname}"
		git pull origin "${_gitbranch}"
		msg "The local files are updated."
	else
		git clone "${_gitroot}"
		cd "${_gitname}"
		git checkout "${_gitbranch}"
	fi

	msg "Git checkout done or server timeout."
}

package() {
	cd "${srcdir}/${_gitname}/dev_server"
	python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
	
}

