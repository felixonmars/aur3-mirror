# Maintainer: merilius
pkgbase=python-power
pkgname=python-power-git
pkgver=20130226
pkgrel=2
pkgdesc="A Python module that allows you to get power and battery status of the system"
depends=('python')
makedepends=('git' 'python-distribute')
provides=('python-power')
url="https://github.com/GreatFruitOmsk/Power"
license=('MIT')
arch=('any')
source=()

_gitroot="https://github.com/GreatFruitOmsk/Power.git"
_gitname="Power"
_gitbranch="master"


build()
{
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

package()
{
	cd "${srcdir}/${_gitname}"
	python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 || return 1
}
