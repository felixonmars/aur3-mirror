# Maintainer: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=bgrease-git
pkgver=20121206
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/Beliaar/bGrease"
license=('MIT')
depends=('python2>=2.6')
makedepends=('git')

_gitroot="git://github.com/Beliaar/bGrease.git"
_gitname="bGrease"

source=()
md5sums=()

build() {
	cd ${srcdir}
    msg "Connecting to GIT server...."
	
	if [ -d "${srcdir}/${_gitname}" ] ; then
		cd ${_gitname}
		git checkout run_uh.py
		git pull
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	
	cd ${srcdir}/${_gitname}
	python2 setup.py install --home=$pkgdir/usr || return 1
	mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
	mv $pkgdir/usr/lib/python/* $pkgdir/usr/lib/python2.7/site-packages/
	rm -rf $pkgdir/usr/lib/python
}

# vim:set ts=2 sw=2 et:
			
