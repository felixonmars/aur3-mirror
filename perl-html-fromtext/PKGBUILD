#Contributor: Sergey Dovgal <arcadoss@gmail.com> 

pkgname=perl-html-fromtext
_realname=HTML-FromText
pkgver=2.05
pkgrel=1
pkgdesc="HTML::FromText - Convert plain text to HTML"
arch=(i686 x86_64)
license=('PerlArtistic')
url="http://search.cpan.org/dist/${_realname}/"
depends=('perl>=5.10.0' 'perl-email-find')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CW/CWEST/$_realname-$pkgver.tar.gz)
md5sums=('fb8ae4ab0cae0b57101f78b046b3927b')

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
