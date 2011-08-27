# -*- mode: sh; -*-
# Contributor: stuck_pxl <flam44@gmail.com>

pkgname=emacs-eproject-git
pkgver=20110327
pkgrel=1 
pkgdesc="eproject is an Emacs extension that adds the concept of projects to Emacs"
url="https://github.com/jrockway/eproject/wiki"
arch=('any')
license=('GPL2')
depends=('emacs>=23')
makedepends=('git')

_gitroot="git://github.com/jrockway/eproject.git"
_gitname="eproject"

install=$pkgname.install

build() {
    if [ -d $srcdir/$_gitname/ ]; then
	cd $srcdir/$_gitname/ && git pull origin
    else
        git clone $_gitroot $_gitname
    fi

    install -d $pkgdir/usr/share/emacs/site-lisp/$_gitname/
    install -m644 $srcdir/$_gitname/*.el -t $pkgdir/usr/share/emacs/site-lisp/$_gitname/
}

