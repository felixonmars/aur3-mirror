pkgname=unsort
pkgver=0.5
pkgrel=1
pkgdesc="Unsort unsorts a textfile"
url="http://www.vanheusden.com/unsort/"
license="GPL"
source=('http://www.vanheusden.com/unsort/unsort-'$pkgver'.tgz' 'Makefile.diff')
md5sums=('7e0002f391288756536a890ad8f05292' '323cef3020f78c0b61c4b106c9852438')

build ()
{
cd $startdir/src/$pkgname-$pkgver
patch -p1 < ../Makefile.diff
make || return 1
mkdir -p $startdir/pkg/usr/bin
mkdir -p $startdir/pkg/usr/man/man1
make install prefix=$startdir/pkg/usr
}
