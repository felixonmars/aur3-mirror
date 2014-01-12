# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Elliott Seyler <emhs@mossberg>
pkgname=emacs-wdired-parent-dir
pkgver=1
pkgrel=1

pkgdesc="A patch to WDired (the Emacs Dired buffer editing library) to allow automatic creation of parent directories."
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/emacs/WDired"
license=('GPL')

depends=('emacs')

source=('http://www.emacswiki.org/emacs/download/wdired.el' 
        'create-parent-dirs.patch')
md5sums=('038ce7e614fb4b142578802bddf20c0a'
         '2161dc355fde707dcb1ce45d83f18253')

prepare() {
    patch --follow-symlinks wdired.el create-parent-dirs.patch
}

build() {
    emacs --batch -f batch-byte-compile wdired.el
}

package() {
    install -Dm644 wdired.elc "$pkgdir"/usr/share/emacs/site-lisp/wdired.elc
}

