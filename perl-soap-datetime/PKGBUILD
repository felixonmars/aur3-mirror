# Maintainer: Kasper Laudrup <laudrup@stacktrace.dk>
_perlmod=SOAP-DateTime
pkgname=perl-soap-datetime
pkgver=0.02
pkgrel=1
pkgdesc='Support for converting dates to xsd:dateTime format'
arch=('any')
url='http://search.cpan.org/~mcmahon/SOAP-DateTime-0.02/'
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-date-manip')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/M/MC/MCMAHON/$_perlmod-$pkgver.tar.gz")
md5sums=('85c04c5d9cc8de06fabc501229fdf31c')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Makefile.PL &&
    make &&
    make test; } || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}
