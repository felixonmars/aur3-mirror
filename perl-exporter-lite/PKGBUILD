# Contributor: Sergey Dovgal <arcadoss@gmail.com> 

pkgname=perl-exporter-lite
_realname=Exporter-Lite
pkgver=0.02
pkgrel=1
pkgdesc="Exporter::Lite - Lightweight exporting of variables"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/~mschwern/$_realname-$pkgver/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWERN/$_realname-$pkgver.tar.gz)
md5sums=('e2ed5978a09020de16b5cf30c84566b0')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim: ts=2 sw=2 et ft=sh
