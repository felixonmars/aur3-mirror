# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-dist-zilla-plugin-git'
pkgver='1.113560'
pkgrel='1'
pkgdesc="update your git repository after release"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010' 'perl-datetime' 'perl-file-chdir' 'perl-git-wrapper' 'perl-moose' 'perl-moose-autobox' 'perl-moosex-has-sugar' 'perl-moosex-types' 'perl-namespace-autoclean>=0.09' 'perl-string-formatter' 'perl-version-next')
makedepends=('perl-dist-zilla' 'perl-file-copy-recursive' 'perl-file-pushd' 'perl-file-which' 'perl-path-class' 'perl-test-exception')
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Git'
source=('http://search.cpan.org/CPAN/authors/id/J/JQ/JQUELIN/Dist-Zilla-Plugin-Git-1.113560.tar.gz')
md5sums=('face017015702d6ae8fa2f4f27130d74')
sha512sums=('9de77fab3dd9aa32a4771095c74b159697017a75a9e2f769bbbcb0c5bbe55cb3b7abeced24e99ff8bd07baa3d1811947cdf1752d575ef96913eadfef11fccc9b')
_distdir="${srcdir}/Dist-Zilla-Plugin-Git-1.113560"

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
