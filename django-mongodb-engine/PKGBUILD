pkgname=django-mongodb-engine
pkgver=20101211
pkgrel=1
pkgdesc='A MongoDB backend standing outside django.'
url="http://github.com/aparo/django-mongodb-engine"
arch=('any')
depends=('django-nonrel' 'django-toolbox' 'mongodb')
makedepends=('python2')
license=('unknown')

_gitroot=git://github.com/aparo/django-mongodb-engine.git
_gitname=django-mongodb-engine

build() {
	cd $srcdir

	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git-pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"

	cd "$srcdir/$_gitname"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_gitname"
	python2 setup.py install --root=$pkgdir --optimize=1
}
