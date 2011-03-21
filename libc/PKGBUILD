# Maintainer: Dmitrij Smirnov <info@igus.lv>

pkgname=libc
pkgrel=1
pkgver=2.7
pkgdesc="Documentation for libc to be used in devhelp"
arch=('i686' 'x86_64')
license=('GPL')
url="http://htmlhelp.googlecode.com/"
source=(http://htmlhelp.googlecode.com/files/${pkgname}-${pkgver}.tgz)
md5sums=('83a1abb94a4cef576e2407830909da67')


build () {
        # Create destination dir
        install -d ${HOME}/.local/share/devhelp/books/${pkgname}-${pkgver}
	tar -zxvf $startdir/${pkgname}-${pkgver}.tgz
        # Install documentation to destination
 	install -D -m 644 $startdir/src/book/* ${HOME}/.local/share/devhelp/books/${pkgname}-${pkgver}/ 
	install -D -m 644 $startdir/src/book.devhelp ${HOME}/.local/share/devhelp/books/${pkgname}-${pkgver}/${pkgname}-${pkgver}.devhelp
}

