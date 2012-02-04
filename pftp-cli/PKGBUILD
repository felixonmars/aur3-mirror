# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
pkgname=pftp-cli
pkgver=0.3
pkgrel=1
pkgdesc="Text based ftp client. Support for Implicit/Explicit SSL and TLS, FXP and multiple servers connected at the same time."
arch=('i686' 'x86_64')
url="http://pftp.sourceforge.net/"
license=('GPL-2')
depends=('libpftputil' 'readline' 'zlib')
source=('http://prdownloads.sourceforge.net/pftp/pftp-cli-0.3.tar.gz')
md5sums=('c327af3daea20aa998dfca19cfccb809')

build(){
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}
