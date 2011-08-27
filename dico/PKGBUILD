# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=dico
pkgver=2.1
pkgrel=1
pkgdesc="Flexible modular implementation of DICT server"
arch=('i686' 'x86_64')
url="http://puszcza.gnu.org.ua/software/dico/"
license=('GPL3')
options=('!libtool' '!docs')
depends=('libtool' 'libldap')
source=(ftp://ftp.gnu.org/gnu/dico/$pkgname-$pkgver.tar.gz)
md5sums=('bcc757b38cce661b0f22e2572282662e')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}

# vim:set ts=2 sw=2 et:
