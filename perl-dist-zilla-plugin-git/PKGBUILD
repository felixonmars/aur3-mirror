# Maintainer : Konrad Borowski <glitchmr@myopera.com>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-dist-zilla-plugin-git'
pkgver='2.006'
pkgrel='1'
pkgdesc="update your git repository after release"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose'
'perl-datetime'
'perl-dist-zilla>=4'
'perl-file-find-rule'
'perl-file-homedir'
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
'perl-test-exception')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Git'
source=("http://search.cpan.org/CPAN/authors/id/C/CJ/CJM/Dist-Zilla-Plugin-Git-$pkgver.tar.gz")
md5sums=('c9292927066d1d3b7b445fe7bf28c171')
sha512sums=('2f6fb4ff890c903011cbcb2383b2203aae6b0c38ba83bfdfe9ab6633c03cd2bf7ca03e64f4352c0796e6c265c524c222f240edb431410651ef165f8944decaaf')
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
