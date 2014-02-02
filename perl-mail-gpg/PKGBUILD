# Maintainer: Oliver Gasser <oliver.gasser@gmail.com>

_author=J/JR/JRED
_perlmod=Mail-GPG
pkgname=perl-mail-gpg
pkgver=1.0.7
pkgrel=1
pkgdesc="Handling of GnuPG encrypted / signed mails"
arch=('any')
url="http://search.cpan.org/~jred/${_author}-${pkgver}"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.05.03' 'perl-mime-tools>=5.419' 'perl-gnupg-interface')
makedepends=('make')
optdepends=('perl-event')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=("9db49649502474a0daa3e4dc9bf87c79")

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
