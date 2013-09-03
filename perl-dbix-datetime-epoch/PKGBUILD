# Contributor: someonerandom
# Generator  : CPANPLUS::Dist::Arch 0.15
pkgname='perl-dbix-datetime-epoch'
pkgver='0.10'
pkgrel='1'
pkgdesc="DateTime plugin for Catalyst"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-datetime>=0.20' 'perl-sql-translator>=0.11006' 'perl-dbicx-testdatabase' 'perl-dbix-class>=0.08103' 'perl-dbix-class-timestamp>=0.07' 'perl-datetime-format-sqlite')
url='http://search.cpan.org/~bricas/DBIx-Class-DateTime-Epoch/'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/DBIx-Class-DateTime-Epoch-0.10.tar.gz')
md5sums=('7ba532d3091ec27d3b3d0dbd24495a9f')
_distdir="DBIx-Class-DateTime-Epoch-0.10"

build() {
  ( export PERL_MM_USE_DEFAULT=1                              \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"      \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
