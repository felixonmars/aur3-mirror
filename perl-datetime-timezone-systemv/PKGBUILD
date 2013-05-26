# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-datetime-timezone-systemv'
pkgver='0.006'
pkgrel='1'
pkgdesc="System V and POSIX timezone strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-date-iso8601' 'perl-params-classify')
makedepends=()
url='http://search.cpan.org/dist/DateTime-TimeZone-SystemV'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/DateTime-TimeZone-SystemV-0.006.tar.gz')
md5sums=('ab33e9d1cfb688de84e278330ddd5886')
sha512sums=('a0a354b4921970d29a4a3a634d195b6973bda528fe361f7a3df35471eaf80a4f80f9ec1f7a5f9d8a0bce4140db9d13b8e3ddd9c24e2ea6b4e30421de16a0b30f')
_distdir="DateTime-TimeZone-SystemV-0.006"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
