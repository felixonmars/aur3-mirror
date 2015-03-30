# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-dist-zilla'
pkgver='5.034'
pkgrel='1'
pkgdesc="distribution builder; installer not included!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-app-cmd>=0' 'perl-cpan-meta>=0' 'perl-cpan-meta-check>=0.007' 'perl-cpan-uploader>=0.103004' 'perl-class-load>=0.17' 'perl-config-ini>=0' 'perl-config-mvp>=0' 'perl-config-mvp-reader-ini>=2' 'perl-data-section>=0.200002' 'perl-datetime>=0.44' 'perl-extutils-manifest>=1.66' 'perl-file-copy-recursive>=0' 'perl-file-find-rule>=0' 'perl-file-homedir>=0' 'perl-file-sharedir>=0' 'perl-file-sharedir-install>=0.03' 'perl-file-pushd>=0' 'perl-json-maybexs>=0' 'perl-list-moreutils>=0' 'perl-log-dispatchouli>=1.102220' 'perl-mixin-linewise>=0' 'perl-moose>=0.92' 'perl-moosex-lazyrequire>=0' 'perl-moosex-role-parameterized>=0' 'perl-moosex-setonce>=0' 'perl-moosex-types>=0' 'perl-moosex-types-path-class>=0' 'perl-moosex-types-perl>=0' 'perl-ppi>=0' 'perl-params-util>=0' 'perl-path-class>=0.22' 'perl-path-tiny>=0.052' 'perl-perl-prereqscanner>=1.016' 'perl-perl-version>=0' 'perl-pod-eventual>=0.091480' 'perl-software-license>=0.101370' 'perl-string-formatter>=0.100680' 'perl-string-rewriteprefix>=0.005' 'perl-sub-exporter>=0' 'perl-sub-exporter-formethods>=0' 'perl-term-encoding>=0' 'perl-term-ui>=0' 'perl-term-readkey>=0' 'perl-text-glob>=0.08' 'perl-text-template>=0' 'perl-try-tiny>=0' 'perl-yaml-tiny>=0' 'perl-namespace-autoclean>=0' 'perl>=5.8.5')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-failwarnings>=0' 'perl-test-fatal>=0' 'perl-test-file-sharedir>=0')
url='http://search.cpan.org/dist/Dist-Zilla'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Dist-Zilla-5.034.tar.gz')
md5sums=('edf9788f2635ac33fb361c854d61e48b')
sha512sums=('e70d7be4ba807d3f25d83dd721436e7ccb3562f420f7c5a7535a766c5238557bde45baa0039505b808c59691f747eced337aef8a24aef176c3bd6f5dce381ca0')
_distdir="Dist-Zilla-5.034"

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
