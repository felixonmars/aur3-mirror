# Contributor: Daniel Leining <daniel@the-beach.co>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-acme-lolcat'
pkgver='0.0.5'
pkgrel='1'
pkgdesc="SPEEK LIEK A LOLCATZ"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Acme-LOLCAT'
source=('http://search.cpan.org/CPAN/authors/id/K/KC/KCOWGILL/Acme-LOLCAT-0.0.5.tar.gz')
md5sums=('00484594b6b1be2c72b07693a3e47ed2')
sha512sums=('1ae7f988c18e60a40342a73fd6c83a26ac4d62f5bbcaabc86485b21a82504109513088499ff2cac4c8e1da2da789dbd44a0df42bd3677a830e0570d11081bacc')
_distdir="${srcdir}/Acme-LOLCAT-0.0.5"

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
