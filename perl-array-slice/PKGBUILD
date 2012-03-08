# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-array-slice'
pkgver='0.03'
pkgrel='1'
pkgdesc="context-dependent array iterator"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-want')
makedepends=()
url='http://search.cpan.org/dist/Array-Slice'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KARASIK/Array-Slice-0.03.tar.gz')
md5sums=('d1d0312b31ea24c6a33045b55924969b')
sha512sums=('2fe5df636ac3e5e1f570bc333989998cc0e6cf791837ca5fd79abce824851bdc0c61fe566a197eb4445317df9fc1706008b178d005e999ab53b9bf69fb908707')
_distdir="${srcdir}/Array-Slice-0.03"

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
