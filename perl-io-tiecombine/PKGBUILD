# Packager: AUR Perl <aurperl@juster.info>

pkgname=perl-io-tiecombine
pkgver=1.002
pkgrel=1
pkgdesc="produce tied (and other) separate but combined variables"
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl')
url=https://metacpan.org/release/IO-TieCombine
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/IO-TieCombine-${pkgver}.tar.gz")
md5sums=('3f0508284dafe9f674237e99868ba3d2')
sha512sums=('66c779258177490d999d68b3fc7832a9121329760ae4879958edc49b28292c9d91c2599a531a39a0824e213264ed8d10a2de91545c67ee72c11e9c7cb8f56856')
_distdir="${srcdir}/IO-TieCombine-${pkgver}"

build()
(
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
)

check()
(
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    cd "$_distdir"
    make test
)

package() {
    cd "$_distdir"
    make DESTDIR="$pkgdir" install
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
