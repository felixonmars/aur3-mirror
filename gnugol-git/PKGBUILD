# Maintainer: Matt Lundin <mdl@imapmail.org>

pkgname=gnugol-git
pkgver=20110202
pkgrel=1
pkgdesc="A command line web search client supporting org-mode, markdown, and textile"
arch=('i686' 'x86_64')
url="http://gnugol.taht.net/"
license=('AGPL')
depends=('jansson' 'curl')
makedepends=('git')
provides=('gnugol')
source=()
md5sums=() 

_gitroot="git://github.com/dtaht/Gnugol.git"
_gitname="gnugol"


build () {

    cd $srcdir
    msg "Connecting to GIT server..."
    if [[ -d $_gitname ]]; then
	(cd $_gitname && git pull origin)
    else
	git clone $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf $_gitname-build
    cp -r $_gitname $_gitname-build
    cd $_gitname-build
    
    sed -i -e 's|/var/lib/gnugol|/usr/lib/gnugol|' src/include/gnugol_engines.h

    SHAREDLIBDIR=/usr/lib/gnugol make

    if [ -f /usr/bin/emacs ]; then
	emacs --batch -q --no-site-file -f batch-byte-compile src/lisp/gnugol.el
    fi
}

package () {

    cd "$srcdir/$_gitname-build"
    
    install -d $pkgdir/usr/{bin/,lib/gnugol/}
    install -Dm755 src/engines/*.so $pkgdir/usr/lib/gnugol/
    install -Dm755 src/clients/gnugol $pkgdir/usr/bin/

    if [ -f /usr/bin/emacs ]; then
    	install -d $pkgdir/usr/share/emacs/site-lisp/
	install -Dm644 src/lisp/gnugol.el{,c} $pkgdir/usr/share/emacs/site-lisp/
    fi

    install -d $pkgdir/usr/share/man/man1/
    gzip doc/gnugol.1
    install -Dm644 doc/gnugol.1.gz $pkgdir/usr/share/man/man1/
}
