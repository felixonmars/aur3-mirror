# Maintainer: Michael Ivko <ivko.mv@gmail.com>

pkgname=loggedfs
pkgver=0.5
pkgrel=1
pkgdesc="A FUSE-based filesystem which can log every operation that happens in it"
arch=('i686' 'x86_64')
url="http://loggedfs.sourceforge.net/"
license=('GPL')
depends=('fuse' 'rlog' 'pcre' 'libxml2')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('57e6cbe791c98ef287adaf9a36983067')

build() {
    cd "$srcdir"

    make
}

package() {
    cd "$srcdir"

	install -D loggedfs.1.gz $pkgdir/usr/share/man/man1/loggedfs.1.gz
	install -D loggedfs $pkgdir/usr/bin/loggedfs
	install -D loggedfs.xml $pkgdir/etc/loggedfs.xml
}
