# $Id$
# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=netevent-git
pkgver=20121119
pkgrel=1
pkgdesc="Utility for cloning event devices"
url="https://github.com/Blub/netevent"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git')
optdepends=('gnu-netcat: for cloning over network')

_gitroot="git://github.com/Blub/netevent.git"
_gitname="netevent"

build() {
	cd ${srcdir}
	msg "Connecting to GIT server..."

	if [[ -d ${_gitname} ]]; then
		cd ${_gitname} && git pull origin && cd ..
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"

	rm -rf ${_gitname}-build
	git clone ${_gitname}{,-build}
	cd ${_gitname}-build

	# Build
	msg "Starting make..."
	make

	# Fix the scripts for global installation
	sed -i "s/.\/netevent/netevent/" host.sh client.sh
}

package() {
	cd ${srcdir}/${_gitname}-build

	install -m755 -D ./netevent $pkgdir/usr/bin/netevent
	install -m755 -D ./devname $pkgdir/usr/bin/devname

	install -m755 -D ./host.sh $pkgdir/usr/bin/netevent-host
	install -m755 -D ./client.sh $pkgdir/usr/bin/netevent-client
}
