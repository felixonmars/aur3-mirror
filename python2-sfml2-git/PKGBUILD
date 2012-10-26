# Maintainer: Edwin Marshall <emarshall85@gmail.com>
pkgname=python2-sfml2-git
pkgver=20121025
pkgrel=2
pkgdesc="The unofficial Python binding for SFML2"
arch=('i686' 'x86_64')
url="http://openhelbreath.net/python-sfml2/"
license=('LGPL')
depends=('sfml' 'python2')
makedepends=('cython2' 'git')
source=()
md5sums=() 
_gitroot='https://github.com/Sonkun/python-sfml2.git'
_gitname='pysfml2'

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	python2 setup.py build_ext
}

package() {
	cd "$srcdir/$_gitname-build"
	python2 setup.py install --root="${pkgdir}" --prefix=/usr

	# Copying the License file
	install -D -m644 "$srcdir/$_gitname-build/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
