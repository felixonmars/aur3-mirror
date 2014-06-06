# Maintainer: Que Quotion <quequotion@mailinator.com>
# Contributor: Klaas Boesche <aurkagebe@googlemail.com>

pkgname=activity-log-manager-bzr
pkgver=91
pkgrel=1
pkgdesc="A graphical user interface which lets you easily control what gets logged by Zeitgeist."
url="https://launchpad.net/activity-log-manager"
license=('GPL2+')
arch=('any')
install=$pkgname.install
depends=('zeitgeist' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('bzr' 'python-distutils-extra')
optdepends=()
provides=('activity-log-manager')
conflicts=()
replaces=()

_bzrtrunk="https://code.launchpad.net/activity-log-manager/trunk"
_bzrmod="activity-log-manager"

build() {
	cd "$srcdir"
	msg2 "Connecting to Bazaar server and checking out..."

	if [ -d $_bzrmod ] ; then
		cd $_bzrmod && bzr --no-plugins pull $_bzrtrunk -q -r $pkgver
		msg2 "Local files are up to date."
	else
		bzr --no-plugins branch $_bzrtrunk $_bzrmod -q -r $pkgver
	fi
 
	msg2 "BZR checkout done or server timeout."

	rm -rf "$srcdir/$_bzrmod-build"
	cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
	cd "$srcdir/$_bzrmod-build"

	sed -i 's@^#!.*python$@#!/usr/bin/python2@' \
		setup.py activity-log-manager
 	/usr/bin/python2 setup.py build
}

package() {
	cd "$srcdir/$_bzrmod-build"
	/usr/bin/python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 || return 1
}

# vim: set ft=sh ts=3 sw=3 tw=0:
