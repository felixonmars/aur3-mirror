# Maintainer: Jesse McClure AKA "Trilby" <jmcclure [at] cns [dot] umass [dot] edu>
pkgname=scrollwm-git
pkgver=20121210
pkgrel=1
pkgdesc="Scrolling, zooming, tagging, floating window manager"
url="http://github.com/TrilbyWhite/scrollwm.git"
arch=('any')
license=('GPLv3')
depends=('libx11')
makedepends=('git')
_gitroot="git://github.com/TrilbyWhite/scrollwm.git"
_gitname="scrollwm"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"
    msg "Starting make..."
    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"
	if [[ -f ~/.scrollwm_conf.h ]]; then
		msg "Using user config from ~/.ttwm_conf.h"
		msg "  Be sure to check for changes to default config.h"
		cp ~/.scrollwm_conf.h ./config.h
	else
		msg "Using default config"
	fi
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make PREFIX=/usr DESTDIR=$pkgdir install
}

