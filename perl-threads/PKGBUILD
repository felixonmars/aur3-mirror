# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-threads'
pkgver='1.86'
pkgrel='1'
pkgdesc="Perl interpreter-based threads"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.14' 'perl')
makedepends=()
url='http://search.cpan.org/dist/threads'
source=('http://search.cpan.org/CPAN/authors/id/J/JD/JDHEDDEN/threads-1.86.tar.gz')
md5sums=('d1398760a4a5c4b41cd42b624fff91c2')
sha512sums=('00bfc132d291c44095c8c8caf046a774b54669e5861424addfa84baaa49b31bda0ed5a5a9b6a8e324b67989699b7c65d7eee4fb8262cb739f5a7fa3967f9e837')
_distdir="${srcdir}/threads-1.86"

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
