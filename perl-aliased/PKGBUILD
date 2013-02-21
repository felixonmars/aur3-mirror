# Maintainer: Konrad Borowski <glitchmr@myopera.com>

pkgname=perl-aliased
pkgver=0.31
pkgrel=1
pkgdesc="Use shorter versions of class names."
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
makedepends=('perl-module-build>=0.4000')
url=https://metacpan.org/release/aliased
source=("http://search.cpan.org/CPAN/authors/id/O/OV/OVID/aliased-${pkgver}.tar.gz")
md5sums=('869a73038bd769b5528ac81c326162f2')
sha512sums=('3a90100ff85f97bc682d423dc32991c98f7637dd2c14156cf189be437ec7be0b689ea04e12283ad050e0ff854aa76a71a3a977161567fac01e9b7ddffe5b6ccd')
_distdir="${srcdir}/aliased-${pkgver}"

build()
(
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Build.PL
    ./Build
)

check()
(
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    cd "$_distdir"
    ./Build test
)

package() {
    cd "$_distdir"
    ./Build install
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
