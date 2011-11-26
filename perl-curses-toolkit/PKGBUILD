# Contributor: Natal Ngétal <hobbestigrou@erakis.im>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-curses-toolkit'
pkgver='0.207'
pkgrel='1'
pkgdesc="a modern Curses toolkit"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-curses' 'perl-html-parser' 'perl-list-moreutils' 'perl-moose>=0.92' 'perl-moosex-followpbp' 'perl-moosex-has-sugar' 'perl-params-validate' 'perl-poe' 'perl-relative' 'perl-tie-array-iterable' 'perl-universal-require>=0.13')
makedepends=('perl-aliased' 'perl-io-pty-easy' 'perl-test-exception')
url='http://search.cpan.org/dist/Curses-Toolkit'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAMS/Curses-Toolkit-0.207.tar.gz')
md5sums=('6f44e0381d4980f6073ef35e0dd7b7fc')
sha512sums=('37f7f9cbd592ff5598e84fb737fe3d04788a7e1576edb0c2bc9e4d465cb2afe65e7e770f53c9171467e327e53fb800f2304eb9f22333f46e055025a35b6b626a')
_distdir="${srcdir}/Curses-Toolkit-0.207"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
