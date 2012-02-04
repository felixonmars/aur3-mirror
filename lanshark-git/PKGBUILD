# Maintainer: Stanislav GE <ginermail@gmail.com>

pkgname=lanshark-git
pkgver=20090821
pkgrel=1
pkgdesc="A P2P Filesharing tool for local area networks (git version)"
arch=(i686 x86_64)
url=http://lanshark.29a.ch
license=(GPL3)
depends=('python>=2.5' 'pygtk>=2.10' python-simplejson)
makedepends=(git)
conflicts=(lanshark)
provides=(lanshark)
_gitroot=http://29a.ch/git/lanshark.git
_gitname=lanshark

build() {
	# get source
	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi
	git clone $_gitname $_gitname-build

	# build and install
	cd ${srcdir}/$_gitname-build
	python setup.py build || return 1
	python setup.py install --root $pkgdir || return 1
}
