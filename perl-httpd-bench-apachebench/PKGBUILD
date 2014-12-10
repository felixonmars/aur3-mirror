# Maintainer : Nigel Gourlay <ngourlay@gmail.com>

pkgname=perl-httpd-bench-apachebench
_cpanname=ApacheBench
pkgver=0.73
pkgrel=1
pkgdesc="Perl API for Apache benchmarking and regression testing"
arch=('any')
url="http://search.cpan.org/~ADIRAJ/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-net-http>=0.00')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/A/AD/ADIRAJ/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('96fd85c2b90f59da0fcaa8c5ac4117b9')
build() {
  cd $srcdir/${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}
package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
