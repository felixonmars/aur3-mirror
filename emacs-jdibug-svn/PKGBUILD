# -*- mode: sh; -*-
# Contributor: m039 <flam44 (at) gmail (dot) com>

pkgname=emacs-jdibug-svn
pkgver=478
pkgrel=1
pkgdesc="Fully Elisp Java Debugger"
url="http://code.google.com/p/jdibug/"
arch=('any')
license=('GPL3')
depends=('emacs' 'cedet')
makedepends=('subversion')
install=$pkgname.install

_svntrunk="http://jdibug.googlecode.com/svn/trunk/"
_svnmod="jdibug-read-only"

_pkg_emacs=$pkgdir/usr/share/emacs/site-lisp/
_pkg_info=$pkgdir/usr/share/info/

build() {
    cd $srcdir

    if [ -d $_svnmod/.svn ]; then
	(cd $_svnmod && svn up -r $pkgver)
    else
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    # cedet-1.0pre7 is a fake for the jdibug Makefile
    ln -Tfs /usr/share/emacs/site-lisp/cedet/ cedet-1.0pre7
    # the second fake to trick the Makefile
    export HOME=$srcdir
    
    cd $_svnmod
    
    make

    install -d $_pkg_emacs/jdibug
    install -d $_pkg_info
    
    tar --strip-components=1 -xjf ./build/jdibug-*.tar.bz2 -C $_pkg_emacs/jdibug

    install -m644 $_pkg_emacs/jdibug/jdibug.info -t $_pkg_info/
}


