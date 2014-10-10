# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-app-iptables2dot'
pkgver='0.2.1'
pkgrel='1'
pkgdesc="turn iptables-save output into graphs for GraphViz"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-probe-perl>=0' 'perl>=5.10.1')
makedepends=()
url='http://search.cpan.org/dist/App-Iptables2Dot'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAMAWE/App-Iptables2Dot-v0.2.1.tar.gz')
md5sums=('41efe17374c12f8e090c7a81adc23b34')
sha512sums=('3c0273267856e8f94b629d4eb9d5a6b996f143ba82e4097a85c9e0fda65d2869b18697e30fd9ae71e9d063310a89495075a4b6e4f9f403a6711b29e86b2a56bd')
_distdir="App-Iptables2Dot-v0.2.1"

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
