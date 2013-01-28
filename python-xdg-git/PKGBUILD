# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>

pkgname=python-xdg-git
pkgver=20130128
pkgrel=1
pkgdesc="Python bindings for freedesktop.org XDG specs"
arch=('any')
license=('MIT')
url="https://github.com/Adys/python-xdg"
depends=('python')
makedepends=('python')

_gitroot="git://github.com/Adys/python-xdg.git"
_gitname="python-xdg"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server..."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
		cd ..
	else
		git clone --depth=1 $_gitroot $_gitname
	fi
	msg "GIT checkout done or server timeout"

	# Build python 3 module
	cd "${srcdir}/${_gitname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_gitname}"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
