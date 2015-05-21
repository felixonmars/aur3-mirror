# Maintainer:  <elektrokid>

pkgname=perl-net-proxy
_realname=Net-Proxy
pkgver=0.13
pkgrel=2
pkgdesc="Perl Module:  Framework for proxying network connections in many ways"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
#options=(!emptydirs)
source=(http://www.cpan.org/authors/id/B/BO/BOOK/${_realname}-${pkgver}.tar.gz)
md5sums=('675618d827db2bb5b0751d3b085a1cb7') 

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make install DESTDIR=${pkgdir} || return 1
  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete

}
