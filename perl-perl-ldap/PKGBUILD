# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-perl-ldap'
pkgver='0.57'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-authen-sasl>=2.00' 'perl-convert-asn1>=0.2' 'perl-digest-hmac' 'perl-gssapi' 'perl-http-message' 'perl-http-negotiate' 'perl-io-socket-inet6' 'perl-io-socket-ssl>=1.26' 'perl-json' 'perl-libwww' 'perl-lwp-mediatypes' 'perl-uri' 'perl-xml-sax-base' 'perl-xml-sax-writer')
makedepends=()
url='http://search.cpan.org/dist/perl-ldap'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARSCHAP/perl-ldap-0.57.tar.gz')
md5sums=('deff50f0de5d4cf95145765b6edd67d1')
sha512sums=('3be234a55b68355d7dc4824cbbe9c9e36346ff266bf9746156e9a9ad93475b72eb866c987f5257b18b0d665a9a51985df6747dc702fdd624e8f87501c5180a00')
_distdir="perl-ldap-0.57"

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
