# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-module-pluggable'
pkgver='5.1'
pkgrel=1
pkgdesc="automatically give your module the ability to have plugins"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
url='http://search.cpan.org/dist/Module-Pluggable'
source=("http://search.cpan.org/CPAN/authors/id/S/SI/SIMONW/Module-Pluggable-${pkgver}.tar.gz")
md5sums=('1b71ed7a67ad8c048d1499540bc892ba')
sha512sums=('2ed43516ff18f50ac494f6365296f42e7dfc6704a2b01d3661ca00c295ee378184757cb03381400fba8bc5f2df06241f2ee9ecf930af4d498b042c68069a670b')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Module-Pluggable-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
