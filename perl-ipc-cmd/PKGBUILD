# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-ipc-cmd'
pkgver='0.82'
pkgrel='1'
pkgdesc="finding and running system commands made easy"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/IPC-Cmd'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/IPC-Cmd-0.82.tar.gz')
md5sums=('3acdb91ae7ad39ab6e6056b7150f53ae')
sha512sums=('03624222c38ad0692f66cff2f106c54dcd4b925be1b70050a95f2795cb847f373780da93d8c76ca5ed321105344610d63d6453be9b98e3b567c3ccd3b2cb655e')
_distdir="IPC-Cmd-0.82"

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
