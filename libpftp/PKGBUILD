# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
pkgname=libpftp
pkgver=0.6
pkgrel=1
pkgdesc="Ftp lib support for Implicit/Explicit SSL and TLS, FXP and multiple servers connected at the same time."
arch=('i686' 'x86_64')
url="http://pftp.sourceforge.net/"
license=('GPL-2')
depends=('openssl')
source=('http://prdownloads.sourceforge.net/pftp/libpftp-0.6.tar.gz')
md5sums=('903e0bd13db0c8b9ab6f57a8e0533b7e')

build(){
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}
