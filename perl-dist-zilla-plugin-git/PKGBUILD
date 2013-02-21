# Maintainer : Konrad Borowski <glitchmr@myopera.com>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-dist-zilla-plugin-git'
pkgver='2.009'
pkgrel='1'
pkgdesc="update your git repository after release"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose'
'perl-datetime'
'perl-dist-zilla>=4'
'perl-file-chdir'
'perl-git-wrapper>=0.021'
'perl-ipc-system-simple'
'perl-list-allutils'
'perl-moose-autobox'
'perl-moosex-attributeshortcuts'
'perl-moosex-has-sugar'
'perl-moosex-types'
'perl-moosex-types-path-class'
'perl-path-class>=0.22'
'perl-string-formatter'
'perl-try-tiny'
'perl-version-next'
'perl-namespace-autoclean')
makedepends=('perl-dist-zilla'
'perl-file-copy-recursive'
'perl-file-path>=2.07'
'perl-file-which'
'perl-file-pushd'
'perl-log-dispatchouli'
'perl-test-fatal>=0.006')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Git'
source=("http://search.cpan.org/CPAN/authors/id/C/CJ/CJM/Dist-Zilla-Plugin-Git-$pkgver.tar.gz")
md5sums=('01fd6420e4475f7103f0d67b064efd5b')
sha512sums=('1aba3167da32ef0bd0ffca574991fe00424b778858c9f75e42e689eac5783a1abe3ec867893910f28950ddfea76c332aed2ed9ffcee1af49a4c08191e149aa3d')
_distdir="${srcdir}/Dist-Zilla-Plugin-Git-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
