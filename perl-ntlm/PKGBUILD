# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-ntlm'
pkgver='1.09'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-hmac>=0')
makedepends=()
url='http://search.cpan.org/dist/NTLM'
source=('http://search.cpan.org/CPAN/authors/id/N/NB/NBEBOUT/NTLM-1.09.tar.gz')
md5sums=('da314ee94b14af2a2f39b6f2c0046e73')
sha512sums=('faae9a4a39f483a9612e5a7daec15bb8ddd940ccc73e52372dd004a9067336fccc4c490deafb3eaa0cf56c0dfe3a085cb6bba38631a5122c2f2fa6e960845039')
_distdir="NTLM-1.09"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
