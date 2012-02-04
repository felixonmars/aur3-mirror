# Contributor: giniu <gginiu@gmail.com>
pkgname=perl-makefile-dom
pkgver=0.006
pkgrel=1
pkgdesc="Simple DOM parser for Makefiles"
arch=(any)
url="http://search.cpan.org/~agent/Makefile-DOM/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-clone>=0.18' 'perl-list-moreutils>=0.21' 'perl-params-util>=0.22')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/A/AG/AGENT/Makefile-DOM-$pkgver.tar.gz)
md5sums=('c9136d35514d3445288d5f4b8cea5703')

build() {
  cd "$srcdir/Makefile-DOM-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
