# Maintainer: David Pflug <viaken@gmail.com>
_author=TLINDEN
_perlmod=Crypt-PWSafe3
pkgname=perl-crypt-pwsafe3
pkgver=1.16
pkgrel=1
pkgdesc="Read and write Passwordsafe v3 files"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
source=(http://cpan.perl.org/modules/by-authors/id/T/TL/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('85a7868014ecacfc3bd1db57b3bdc75a896d869b0a40ed9a364447f4ec757371')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
