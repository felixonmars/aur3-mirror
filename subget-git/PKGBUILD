# Maintainer: Mladen Milinkovic <maxrd2 at smoothware dot net>

pkgname=subget-git
pkgver=1.7.6.1.cedc511
pkgrel=1
pkgdesc="Simple Subtitles downloading program for Linux with PyGTK. Supports plugins and multi-language."
arch=('any')
url="https://github.com/webnull/subget"
license=('GPL3')
depends=('pygtk')
makedepends=('git' 'python2-setuptools')
conflicts=('subget')
provides=('subget')
source=('git+https://github.com/webnull/subget.git')
md5sums=('SKIP')

_gitname="subget"

pkgver() {
	export APP_VER=${pkgver}
	cd ${srcdir}/${_gitname}
	echo -n `sed -n 's/<version.*>\(.*\)<\/version>/\1/p' ./usr/share/subget/version.xml`.`git describe --always | sed 's|-|.|g'`
}

build() {
	cd ${srcdir}/${_gitname}
	./setup.py build
}

package() {
	cd ${srcdir}/${_gitname}
	./setup.py install --root="${pkgdir}" install_data --install-dir="${pkgdir}/usr"
}
