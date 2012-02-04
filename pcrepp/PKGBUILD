# Maintainer: Jose Negron <josenj.arch@mailnull.net>
pkgname=pcrepp
pkgver=0.9.5
pkgrel=2
license=('LGPL')
pkgdesc="PCRE++ is a C++ wrapper-class for the great library PCRE. (Perl Compatible Regular Expressions)"
arch=('i686' 'x86_64')
url="http://www.daemon.de/PCRE"
depends=('bash' 'pcre>=4.5')
makedepends=('gcc' 'make')
source=("http://www.daemon.de/idisk/Apps/pcre++/pcre++-$pkgver.tar.gz")
options=(!libtool)
md5sums=('1fe6ea8e23ece01fde2ce5fb4746acc2')
		   
build() {
cd $startdir/src/pcre++-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
mkdir -p $startdir/pkg/usr/share
mv $startdir/pkg/usr/doc $startdir/pkg/usr/share 
mv $startdir/pkg/usr/man $startdir/pkg/usr/share
}

