# Contributor: Orivej Desh <masecretaire@gmx.fr>
# Maintainer: Orivej Desh <masecretaire@gmx.fr>
pkgname=minidjvu
pkgver=0.8
pkgrel=3
pkgdesc="Highly efficient DjVu encoder for black-and-white images"
arch=('i686' 'x86_64')
url="http://minidjvu.sourceforge.net/"
license=('GPL')
depends=("libtiff")
options=("!libtool" "!makeflags")
source=("http://downloads.sourceforge.net/project/minidjvu/minidjvu/$pkgver/minidjvu-$pkgver.tar.gz")
md5sums=('b354eb74d83c6e2d91aab2a6c2879ba7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/lib
  sed -i -e 's#-9 \$(MANDIR)#-9 $(DESTDIR)$(MANDIR)#' Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir"/usr/{bin,lib,share/man/man1}
  make DESTDIR="$pkgdir/" install
}

