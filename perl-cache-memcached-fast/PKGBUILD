# Maintainer : Nigel Gourlay <ngourlay@gmail.com>
pkgname=perl-cache-memcached-fast
_cpanname=Cache-Memcached-Fast
pkgver=0.23
pkgrel=1
pkgdesc="Perl client for memcached, in C language"
arch=('any')
url="http://search.cpan.org/~KROKI/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=()
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/K/KR/KROKI/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('fa395c4109168bade12f3bd5a2148286')
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
