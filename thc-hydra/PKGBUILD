# Maintainer: zephrax <zephrax@gmail.com>

pkgname=thc-hydra
pkgver=7.3
pkgrel=2
pkgdesc="A very fast network logon cracker which support many different services."
arch=('i686' 'x86_64')
url="http://www.thc.org/thc-hydra/"
license="GPL3"
depends=('krb5' 'openssl' 'postgresql-libs' 'subversion' 'apr' 'apr-util' 'libssh' 'flamerobin' 'libmysqlclient' 'libidn')
source=("http://www.thc.org/releases/hydra-$pkgver.tar.gz")
md5sums=('34f9c21eae24fdc542ba21abc61b05d1')

build() {
	cd $srcdir/hydra-$pkgver

	./configure --prefix=/usr --mandir=/usr/share/man
	make
} 

package() {
    cd $srcdir/hydra-$pkgver
    mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/man/man1 $pkgdir/usr/man/man1
    make PREFIX=$pkgdir/usr install
    mv $pkgdir/usr/man/man1/* $pkgdir/usr/share/man/man1/
    rm -rf $pkgdir/usr/man
}

