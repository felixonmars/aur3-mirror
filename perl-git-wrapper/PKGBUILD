# Contributor: Javier Tiá <javier.tia _at_ gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-git-wrapper'
pkgver='0.029'
pkgrel='1'
pkgdesc="Wrap git(7) command-line interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-env-path' 'perl-file-pushd' 'perl-sort-versions')
url='http://search.cpan.org/dist/Git-Wrapper'
source=('http://search.cpan.org/CPAN/authors/id/G/GE/GENEHACK/Git-Wrapper-0.029.tar.gz')
md5sums=('dd53da091cc9286038ce7d0e150d5708')
sha512sums=('04af2e72aafb098614f385860d4048769ddab7077fb3f3616e5765905899b2d8ef18fff5b67eef63b09df748c38009227050a91f4d7fb87c2360223f0bad9b27')

build() {
  (
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""               \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

    cd "${srcdir}/Git-Wrapper-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

package() {
  cd "${srcdir}/Git-Wrapper-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
