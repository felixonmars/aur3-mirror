# Maintainer : Konrad Borowski <glitchmr@myopera.com>
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-dist-zilla-plugin-git'
pkgver='2.007'
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
'perl-test-fatal')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Git'
source=("http://search.cpan.org/CPAN/authors/id/C/CJ/CJM/Dist-Zilla-Plugin-Git-$pkgver.tar.gz")
md5sums=('e2a008989902c92cfdb87112050cea1f')
sha512sums=('a04679233e0924e362aae6a8138b91641436c6163c568f0792d525d891b21fe4a8490e71ddf0c8fdb3f43536f4f302607bf947910bdc5fb2a31fa69a63bfd265')
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
