# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-html-template-pro
pkgver=0.9509
pkgrel=1
pkgdesc="Perl/XS module to use HTML Templates from CGI scripts"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/HTML-Template-Pro/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/V/VI/VIY/HTML-Template-Pro-${pkgver}.tar.gz")
md5sums=('d34d0952a1ac27ef826775a979c4edc9')

build() {
  cd $srcdir/HTML-Template-Pro-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $srcdir/HTML-Template-Pro-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
