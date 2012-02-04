# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=gnome-activity-journal-bzr
pkgver=1230
pkgrel=1
pkgdesc="A tool for easily browsing and finding files on your computer, developmental code."
url="https://launchpad.net/gnome-activity-journal"
license=('GPL3' 'CCPL:by-nc-sa')
arch=('any')
install=$pkgname.install
depends=('python2-libgnome' 'python2-gconf' 'zeitgeist' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('bzr' 'python-distutils-extra')
optdepends=('indicator-application: implements the appindicator.'
            'gstreamer0.10-python: add multimedia tooltip to multimedia files.'
            'python2-pygments: get a thumbnail of a text file.')
provides=('gnome-activity-journal' 'gnome-activity-journal-git')
conflicts=('gnome-activity-journal' 'gnome-activity-journal-git')
replaces=('gnome-activity-journal-git')

_bzrtrunk="https://code.launchpad.net/gnome-activity-journal/trunk"
_bzrmod="gnome-activity-journal"

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
		src/config.py gnome-activity-journal
 	/usr/bin/python2 setup.py build
}

package() {
	cd "$srcdir/$_bzrmod-build"
	/usr/bin/python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim: set ft=sh ts=3 sw=3 tw=0:
