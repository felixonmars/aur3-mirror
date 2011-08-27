# Contributor: giniu <gginiu@gmail.com>
pkgname=perl-makefile-parser
pkgver=0.215
pkgrel=1
pkgdesc="A simple parser for Makefiles"
arch=(any)
url="http://search.cpan.org/~agent/Makefile-Parser/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-class-accessor' 'perl-makefile-dom>=0.03'
          'perl-ipc-run3>=0.036' 'perl-class-trigger>=0.13' 
          'perl-list-moreutils' 'perl-file-slurp')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/A/AG/AGENT/Makefile-Parser-$pkgver.tar.gz)
md5sums=('f80b65da36c3fd004c8b7067e99c2c9f')

build() {
  cd "$srcdir/Makefile-Parser-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
