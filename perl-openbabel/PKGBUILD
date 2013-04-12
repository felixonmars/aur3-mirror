# $Id$
# Maintainer: Aurelien Grosdidier <aurelien.grosdidier@gmail.com>

pkgname=('perl-openbabel')
pkgver=2.3.2
pkgrel=1
pkgdesc='Perl bindings for the openbabel library'
arch=('x86_64' 'i686')
url='http://openbabel.org/wiki/Perl'
license=('GPL')
depends=('gcc-libs' "openbabel=${pkgver}" 'eigen2')
makedepends=('cmake' 'perl')
options=('!libtool')
source=("http://downloads.sourceforge.net/openbabel/openbabel-$pkgver.tar.gz")
sha256sums=('4eaca26679aa6cc85ebf96af19191472ac63ca442c36b0427b369c3a25705188')

build() {
  cd $srcdir/openbabel-$pkgver
  # Create babelconfig.h
  cmake .
}

package() {
  depends+=('perl')
  cd "$srcdir/openbabel-$pkgver/scripts/perl"
  perl Makefile.PL DESTDIR=$pkgdir
  make
  make install
}

# vim:set ts=2 sw=2 et:
