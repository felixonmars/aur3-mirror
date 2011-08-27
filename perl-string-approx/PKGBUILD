# Contributor: mezcal <fila at pruda dot com>
pkgname=perl-string-approx
_realname=String-Approx
pkgver=3.26
pkgrel=1
pkgdesc="Perl module: for approximate matching (fuzzy matching)"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/J/JH/JHI/${_realname}-$pkgver.tar.gz)
md5sums=('fc14d72986431025125d4970dd6b7f88')

build() {
  cd ${srcdir}/${_realname}-$pkgver
  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
