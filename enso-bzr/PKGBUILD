# Maintainer Matthew Bauer <mjbauer95@gmail.com>

pkgname=enso-bzr
_realname=enso
pkgver=142
pkgrel=1
pkgdesc="Enso's goal is to provide a way of accessing whatever piece of functionality you need -- be it calculating an expression, calling up a map, or performing a Google search -- with a few, semantically meaningful keystrokes."
arch=('i686' 'x86_64')
url="http://humanized.com/enso/launcher/"
license=('custom')
depends=('python' 'pycairo' 'pygobject' 'pygtk' 'python-xlib' 'pyxdg')
makedepends=('bzr')
provides=(${_realname})
conflicts=(${_realname})
install=
source=(run)
md5sums=('67bc84bdb233566f716fee5142dcde88')

_bzrtrunk=https://code.launchpad.net/enso/community-enso
_bzrmod=community-enso

build() {
	mkdir -p ${pkgdir}/usr/bin
	ln -s /usr/share/enso/run ${pkgdir}/usr/bin/enso
	
	cd ${srcdir}

	msg "Connecting to the server...."

	if [ -d "$srcdir/$_bzrmod" ] ; then
		cd $_bzrmod && bzr up
		msg "The local files are updated."
	else
		bzr checkout $_bzrtrunk $_bzrmod
		cd $_bzrmod
	fi

	msg "BZR checkout done or server timeout"
	
	mkdir -p ${pkgdir}/usr/share/enso
	cp -r enso media scripts ${pkgdir}/usr/share/enso

	cd ..

	cp run ${pkgdir}/usr/share/enso
	chmod +x ${pkgdir}/usr/share/enso/run
}
