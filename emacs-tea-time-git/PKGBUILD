# Contributor: m039 <flam44 (at) gmail (dot) com>

pkgname=emacs-tea-time-git
pkgver=20110518
pkgrel=1 
pkgdesc="With this  extension you could set time intervals after which will be the notification."
url="http://www.emacswiki.org/emacs/tea-time"
arch=('any')
license=('GPL2')
depends=('emacs>=23')
makedepends=('git')

_gitroot="git://github.com/krick/tea-time.git"
_gitname="tea-time"

install=$pkgname.install

build() {
    if [ -d $srcdir/$_gitname/ ]; then
	cd $srcdir/$_gitname/ && git pull origin
    else
        git clone $_gitroot $_gitname
    fi

    install -d $pkgdir/usr/share/emacs/site-lisp
    install -m644 $srcdir/$_gitname/*.el -t $pkgdir/usr/share/emacs/site-lisp/
}
