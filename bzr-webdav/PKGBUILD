# Contributor: Matthias Maennich <arch@maennich.net> and Mathieu Pasquet <mathieui@mathieui.net>
pkgname=bzr-webdav
pkgver=73
pkgrel=1
pkgdesc="A WEBDAV plugin for Bazaar."
arch=('i686' 'x86_64')
url=('https://launchpad.net/bzr.webdav')
license=('GPL')
depends=('bzr' 'python2')
source=()
md5sums=()

_bzrbranch=lp:bzr-webdav
_bzrmod=bzr-webdav

build() {
	msg "Connecting to the server...."

	bzr branch ${_bzrbranch} -q

	msg "BZR checkout done or server timeout"
	msg "Starting make..."

	cd $startdir/src/$_bzrmod

	python2 setup.py build
}

package() {
	cd $startdir/src/$_bzrmod
	python2 setup.py install --prefix=$startdir/pkg/usr install
}
