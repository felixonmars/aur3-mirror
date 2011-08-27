# $Id: PKGBUILD, 2009/05/30$
# Maintainer: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
pkgname=gnome-pulse-applet-svn
pkgver=274
pkgrel=1
pkgdesc="This is simple applet for controlling PulseAudio streams."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gnome-pulse-applet/"
provides=('gnome-pulse-applet')
conflicts=('gnome-pulse-applet')
replaces=('gnome-pulse-applet')
license=('GPL3')
depends=('pulseaudio' 'pygtk' 'setuptools' 'gnome-python-desktop' 'python')
makedepends=('subversion')

_svntrunk="http://gnome-pulse-applet.googlecode.com/svn/trunk/"
_svnmod="gnome-pulse-applet-read-only"

build() {
    cd "$srcdir"

    if [ -d $_svnmod/.svn ]; then
	svn up $_svnmod
    else
	svn co $_svntrunk $_svnmod
    fi

    cd $_svnmod

    sed -i 's/lib64/lib/' Makefile

    make PYTHON_VERSION=2.6 || return 1
    make PYTHON_VERSION=2.6 DESTDIR=$pkgdir install
}

