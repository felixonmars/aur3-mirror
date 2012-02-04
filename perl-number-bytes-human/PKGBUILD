# CPAN Name  : Number-Bytes-Human
# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>
# Generator  : CPANPLUS::Dist::Arch 0.20
pkgname='perl-number-bytes-human'
pkgver='0.07'
pkgrel='1'
pkgdesc="Convert byte count to human readable format"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Number-Bytes-Human'
source=('http://search.cpan.org/CPAN/authors/id/F/FE/FERREIRA/Number-Bytes-Human-0.07.tar.gz')
md5sums=('8e5d230709bfc5e919f5f47ed3cb5bdb')

build() {
  DIST_DIR="${srcdir}/Number-Bytes-Human-0.07"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
