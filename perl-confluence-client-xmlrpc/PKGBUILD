# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-confluence-client-xmlrpc'
pkgver='2.2'
pkgrel='1'
pkgdesc="Client for the Atlassian Confluence wiki, based on RPC::XML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-rpc-xml>=0')
makedepends=()
url='http://search.cpan.org/dist/Confluence-Client-XMLRPC'
source=('http://search.cpan.org/CPAN/authors/id/H/HJ/HJANSEN/Confluence-Client-XMLRPC-2.2.tar.gz')
md5sums=('f78f3887a42fdc0ded372e7fdbbc6ca5')
sha512sums=('e3819ae8f6c4442b16c8799f1261a4c6d63ae91059d75739f2a1c2fa026e9ebcd29e7f2cf483d6b03e3c5fd7f10fac1fd08e89d203446eda4592fcb702def6cc')
_distdir="Confluence-Client-XMLRPC-2.2"

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
