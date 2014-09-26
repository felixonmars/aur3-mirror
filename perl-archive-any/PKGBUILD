# Contributor Gustavo Dutra <mechamo@gustavodutra.com>
pkgname=perl-archive-any
_realname=Archive-Any
pkgver=0.0941
pkgrel=2
pkgdesc="Archive::Any - Single interface to deal with file archives"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/~cmoore/${_realname}-${pkgver}/"
options=(!emptydirs)
depends=('perl>=5.10.1' 'perl-archive-zip' 'perl-file-mmagic' 'perl-module-find' 'perl-mime-types' 'perl-test-warn')
#provides=("archive-any=$pkgver" "Archive::Any=$pkgver" "perl-archive-any=$pkgver")
source=(http://search.cpan.org/CPAN/authors/id/O/OA/OALDERS/Archive-Any-$pkgver.tar.gz)
md5sums=('16807a0b984871daa0a5d8f2b48d57e6')
sha512sums=('13fa297792e367560c12d8d22aef8214dbba2a9e0c8cc2b9b01d6e5c21a07f49d45024c930891bf921e53fa9c4443ad14db5ce1ab46bb7825e37fd4881b07ba4')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make install DESTDIR=${pkgdir}

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

# vim:set ts=2 sw=2 et:
