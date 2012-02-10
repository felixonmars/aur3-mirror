# Maintainer: Nathan Hulse <nat.hulse@gmail.com>
pkgname=perl-sys-cpu
pkgver=0.52
pkgrel=1
pkgdesc="Perl extension for getting CPU information. Currently only number of CPU's supported."
arch=('any')
url="http://search.cpan.org/~mkoderer/Sys-CPU-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MK/MKODERER/Sys-CPU-$pkgver.tar.gz)
md5sums=(34305423e86cfca9a631b6f91217f90f)

build() {
  cd "$srcdir/Sys-CPU-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Sys-CPU-$pkgver"
  make install DESTDIR="$pkgdir/"
}
