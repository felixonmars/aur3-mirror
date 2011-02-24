# Maintainer: kevku <kevku@msn.com>
pkgname=perl-sys-portio
pkgver=0.1
pkgrel=1
pkgdesc="Sys::PortIO - perform direct port I/O from Perl"
arch=('x86_64' 'i686')
url="http://search.cpan.org/~andrewho/Sys-PortIO"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/A/AN/ANDREWHO/Sys-PortIO-$pkgver.tar.gz")
md5sums=('be88f2c6001a690e31f384a61bcf6ea4')

build() {
  cd "$srcdir/Sys-PortIO-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Sys-PortIO-$pkgver"
  make install DESTDIR="$pkgdir/"
}

