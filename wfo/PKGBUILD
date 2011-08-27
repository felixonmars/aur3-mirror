# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=wfo
pkgver=0.1
pkgrel=2
pkgdesc="An offline frontend for wikis and blogs."
arch=('i686' 'x86_64')
url="http://www.a-k-r.org/wfo/"
license=('GPL2')
depends=('ruby' 'ruby-htree' 'gnupg')
source=("http://www.a-k-r.org/wfo/$pkgname-$pkgver.tar.gz" "patch")
md5sums=('bb20b1bc01a493d21ba405cd2b1665a5'
         '32970674714c7a49cba99d53fd09c065')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --bindir=/usr/bin

  patch -uN -i $srcdir/patch
  
  make 
}

package() {

  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
