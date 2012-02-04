pkgname=django-facebook-git
pkgver=20111221
pkgrel=1
pkgdesc="Facebook open graph api implementation using the Django web framework in python."
arch=('any')
url="https://github.com/tschellenbach/Django-facebook"
license=('MIT')
depends=('python2' 'django')
makedepends=('git')

_gitroot="https://github.com/tschellenbach/Django-facebook.git"
_gitname="Django-facebook"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	cd $srcdir/$_gitname
	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir --install-data=/usr/share/$pkgname || return 1
} 
