pkgname=perl-pdf-api2-simple
pkgver=1.1.4u
pkgrel=1
pkgdesc="Simplistic wrapper for the excellent PDF::API2 modules"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/PDF-API2-Simple/"
license=('unknown')
source=('http://search.cpan.org/CPAN/authors/id/R/RE/REDTREE/PDF-API2-Simple-1.1.4u.tar.gz')
depends=('perl-pdf-api2')
makedepends=('perl-module-install')
md5sums=('e2c4f5d8eb4ad775f6ca8816cbf45d12')
sha256sums=('c4ebb640f9e47a6b4f05213647a90a0c760d2889b7f1b4f6e4cf44d2e00604ee')
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

