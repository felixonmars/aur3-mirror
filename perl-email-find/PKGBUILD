# Contributor: Sergey Dovgal <arcadoss@gmail.com> 

pkgname=perl-email-find
_realname=Email-Find
pkgver=0.10
pkgrel=1
pkgdesc="Email::Find - Find RFC 822 email addresses in plain text"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/~miyagawa/Email-Find-0.10/"
depends=('perl>=5.10.0' 'perl-email-valid')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/$_realname-$pkgver.tar.gz)
md5sums=('b38339e6c4ef0a13818195d50a193545')

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
