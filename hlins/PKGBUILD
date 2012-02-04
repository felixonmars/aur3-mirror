# Contributor: Your Name <youremail@domain.com>
pkgname=hlins
pkgver=0.39
pkgrel=1
pkgdesc="Insert URLs into html documents"
arch=('i686' 'x86_64')
url="http://www.pps.jussieu.fr/~treinen/hlins/hlins-doc.html"
license=('GPL')
depends=('ocaml')
source=(http://ftp.de.debian.org/debian/pool/main/h/hlins/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('08ae7ffc3f66bbf952b472504f740f96')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"

  mkdir -p "$pkgdir/usr/bin"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
