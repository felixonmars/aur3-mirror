# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=emacs-xcscope
pkgver=1.14
pkgrel=1
pkgdesc="Cscope interface for emacs"
arch=('any')
url="http://cscope.sourceforge.net/"
license=('GPL')
depends=('emacs' 'cscope')
source=(xcscope.el
        cscope-indexer)
md5sums=('13e5fffd198ff2a2a74c7c75ef6ce2f7'
         '95126fca5fd9b85600712002f85ace13')

build() {
    cd $srcdir

    install -Dm 644 xcscope.el $pkgdir/usr/share/emacs/site-lisp/xcscope.el
    install -Dm 755 cscope-indexer $pkgdir/usr/bin/cscope-indexer
}
