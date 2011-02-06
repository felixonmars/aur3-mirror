# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
pkgname=libpftputil
pkgver=0.3
pkgrel=1
pkgdesc="Lib utils for libpftp."
arch=('i686' 'x86_64')
url="http://pftp.sourceforge.net/"
license=('GPL-2')
depends=('libpftp')
source=('http://prdownloads.sourceforge.net/pftp/libpftputil-0.3.tar.gz')
md5sums=('777a8fce0a53f4044b8a1261d243f6d1')

build(){
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}
