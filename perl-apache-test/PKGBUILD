# CPAN Name  : Apache-Test
# Contributor: Caleb Cushing <xenoterracide@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 0.19
pkgname='perl-apache-test'
pkgver='1.32'
pkgrel='1'
pkgdesc="Framework for testing Apache modules"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Apache-Test'
source=('http://search.cpan.org/CPAN/authors/id/P/PH/PHRED/Apache-Test-1.32.tar.gz')
md5sums=('e9249af12e427d58802f1715116aeba7')

build() {
  DIST_DIR="${srcdir}/Apache-Test-1.32"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&make test &&
    make DESTDIR="$pkgdir" install;  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

