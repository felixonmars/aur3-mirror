# Maintainer: Sergey Dovgal <arcadoss@gmail.com> 
# Contributor: Casey West 

pkgname=perl-compess-lzo
_realname=Compress-LZO
pkgver=1.08
pkgrel=1
pkgdesc="Compress::LZO - Interface to the LZO compression library"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/~mfx/$_realname-$pkgver/"
depends=('perl>=5.10.0' 'lzo>=1.08')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MF/MFX/$_realname-$pkgver.tar.gz)
md5sums=('4266ea0cb23817dd02ead4f983c2604f')

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
