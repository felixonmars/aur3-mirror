# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-authen-simple-pam'
pkgver='0.2'
pkgrel='1'
pkgdesc="Simple PAM authentication"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-authen-pam' 'perl-authen-simple')
makedepends=()
url='http://search.cpan.org/dist/Authen-Simple-PAM'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHANSEN/Authen-Simple-PAM-0.2.tar.gz')
md5sums=('0b4eed87d2877cd89e412f04572c71f5')
sha512sums=('836a3913dab19c26ba556efe67176d97fd29fcc46b212886dd50b3669b93611c21ce190e2ddfda7ebbc6e01e83a706e38fed9643f142214b6f03e858645b09f7')
_distdir="${srcdir}/Authen-Simple-PAM-0.2"

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
