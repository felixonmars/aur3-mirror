# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-dist-zilla-plugin-taskweaver'
pkgver='0.101626'
pkgrel='1'
pkgdesc="a PodWeaver plugin used to build Task distributions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=2' 'perl-dist-zilla-plugin-podweaver>=0' 'perl-moose>=0' 'perl-moose-autobox>=0' 'perl-pod-elemental>=0' 'perl-pod-weaver>=3')
makedepends=()
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-TaskWeaver'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Dist-Zilla-Plugin-TaskWeaver-0.101626.tar.gz')
md5sums=('3a9e232f79dd25bb5751a01683209458')
sha512sums=('07d2d98d40f5c4378aaffc137588d8a914443b43198f2e0f3ce04d07cf9f94d9dcfedcf708d2c322277bff2c8433f76e5eaa712951986d460470369bb8444eac')
_distdir="Dist-Zilla-Plugin-TaskWeaver-0.101626"

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
