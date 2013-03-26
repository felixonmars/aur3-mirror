# Contributor: gilles DOT quenot AT gmail DOT com
# Contributor: fabmen
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-net-cups-cups16'
pkgver='0.61'
pkgrel='3'
pkgdesc="Common Unix Printing System Interface"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Net-CUPS'
source=('http://search.cpan.org/CPAN/authors/id/D/DH/DHAGEMAN/Net-CUPS-0.61.tar.gz')
md5sums=('1aba74db9bcf15396005091f826b50e8')

build() {
  DIST_DIR="${srcdir}/Net-CUPS-0.61"

  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
	patch -p 1 < "../../perl-Net-CUPS-0.61-cups16.patch"
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
