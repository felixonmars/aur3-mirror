# Contributor: Nathan Owe. ndowens04 at gmail dot com
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Timo Tomasini < timo at tomasini-mail dot de >

pkgname=cgicc
pkgver=3.2.15
pkgrel=1
pkgdesc='C++ class library for writing CGI applications.'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/cgicc/'
license=('GPL')
depends=('gcc-libs' 'sh')
makedepends=('automake' 'autoconf' 'doxygen')
options=('!libtool')
source=("http://ftp.gnu.org/gnu/cgicc/$pkgname-$pkgver.tar.gz")
md5sums=('717c5957d56911f3922ce5bea56fafd9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR=$pkgdir docdir="/usr/share/doc/$pkgname"
}
