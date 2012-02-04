# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=sprog
pkgver=0.14
pkgrel=1
pkgdesc="A graphical tool which anyone can use to build programs by plugging parts together."
arch=(any)
url="http://sprog.sourceforge.net/"
license=('GPL')
depends=('gtk2-perl' 'gnomecanvas-perl' 'perl-yaml' 'glade-perl')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/Sprog-$pkgver/Sprog-$pkgver.tar.gz")
md5sums=('27e84d7c713bc4527e83a4a5ca231e96')

build() {
  cd "$srcdir/Sprog-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Sprog-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
