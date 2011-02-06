# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=perl-dbd-ingres
pkgver=0.53
pkgrel=1
pkgdesc="DBI driver for Ingres database systems"
arch=(any)
url="http://search.cpan.org/dist/DBD-Ingres/"
license=('unknown')
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SREAGLE/DBD-Ingres-0.53.tar.gz')
md5sums=('4a5e913f3a989e468e62d83e4688d50d')
sha256sums=('746436ba05be19ad9c35a455e7b4d9299646d2b424e748d5bdb070bc67b66437')
depends=('ingres' 'perl-dbi>=1' 'perl-getopt-long')
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

