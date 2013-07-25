# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-file-searchpath'
pkgver='0.06'
pkgrel='1'
pkgdesc="Search for a file in an environment variable path"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/File-SearchPath'
source=('http://search.cpan.org/CPAN/authors/id/T/TJ/TJENNESS/File-SearchPath-0.06.tar.gz')
md5sums=('5cc4743fcacfbe4decd9579d6251457e')
sha512sums=('3e209def4ac4c88186a5126d8ea074f74309c91ae6b1f783e447f6841a9db49c8a4465a3471ac6668eb644251ae6ea8db3fa7f02fff0f0b58abbeaf628feed67')
_distdir="File-SearchPath-0.06"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
