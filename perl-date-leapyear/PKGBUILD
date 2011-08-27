pkgname=perl-date-leapyear
pkgver=1.72
pkgrel=1
pkgdesc="Is a particular year a leap year?"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Date-Leapyear/"
license=('PerlArtistic' 'GPL')
source=('http://search.cpan.org/CPAN/authors/id/R/RB/RBOW/Date-Leapyear-1.72.tar.gz')
md5sums=('bdfe5e8d435d6afcf7103269450e514b')
sha256sums=('706360e57a85cf5c0de1cc6502d0366e876df7b42a2e60192861a273750fa603')
makedepends=('perl-extutils-makemaker')
options=(!emptydirs)

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make  || return 1
    make install DESTDIR="${pkgdir}" || return 1

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor || return 1
    ./Build  || return 1
    ./Build install destdir=${pkgdir} || return 1

  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

# vim:set ts=2 sw=2 et:

