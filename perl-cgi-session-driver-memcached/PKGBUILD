# Maintainer : Nigel Gourlay <ngourlay@gmail.com>

pkgname=perl-cgi-session-driver-memcached
_cpanname=CGI-Session-Driver-memcached
pkgver=0.04
pkgrel=1
pkgdesc="CGI::Session driver for memcached"
arch=('any')
url="http://search.cpan.org/~OINUME/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-cgi-session>=4.00')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/O/OI/OINUME/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('9e2e241282c5f7e9bc5b263fc0368698')
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