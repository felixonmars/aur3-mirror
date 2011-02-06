# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=mirdir
pkgver=2.1
pkgrel=2
pkgdesc="Synchronize two directory trees in a fast way. Only the differences between the two sets of files are copied while the excess files/directories in the destination tree are removed "
arch=('i686' 'x86_64')
url="http://mirdir.sf.net"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-Unix.tar.gz)
md5sums=('56afe2aae7983176fd804c264740d6a2') 

build() {
  cd $srcdir/$pkgname-$pkgver-UNIX

  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver-UNIX
  make prefix=$pkgdir/usr man1dir=$pkgdir/usr/share/man install
}
