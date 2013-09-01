# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=vim-org-mode
_realname=vim-orgmode
pkgver=0.4.1
pkgrel=1
pkgdesc="Text outlining and task management for Vim based on Emacs' Org Mode"
arch=('any')
url="https://github.com/jceb/vim-orgmode"
license=('AGPL3')
depends=('vim')
makedepends=('ditaa')
source=("https://github.com/jceb/$_realname/archive/v${pkgver}.tar.gz")
md5sums=('419fa460ed348ca366cf89593110ac05')

prepare () {

    cd "$srcdir/$_realname-$pkgver"

    sed -i 's/python/python2/g' Makefile

}

build () {

    cd "$srcdir/$_realname-$pkgver"

    make docs

}

check () { 

    cd "$srcdir/$_realname-$pkgver"

    make check
    
}

package () {

    cd "$srcdir/$_realname-$pkgver"

    make PREFIX='/usr' VIMDIR='/usr/share/vim/vimfiles' DESTDIR="$pkgdir" install

    install -d "$pkgdir/usr/share/doc/vim-org-mode" && \
	install -m 644 -t "$pkgdir/usr/share/doc/vim-org-mode" \
	"README.org" \
	"LICENSE" \
	"documentation/diagram.png" \
	"documentation/diagram.txt" \
	"debian/changelog"

}
