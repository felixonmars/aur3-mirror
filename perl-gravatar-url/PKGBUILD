# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-gravatar-url
pkgver=1.06
pkgrel=1
pkgdesc="Make URLs for Gravatars from an email address"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Gravatar-URL/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12' 'perl-net-dns')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSCHWERN/Gravatar-URL-${pkgver}.tar.gz")
md5sums=('50b689e35ec55d959fdaca6a7f7c4f8d')

build() {
  cd $srcdir/Gravatar-URL-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor
  ./Build
}
package() {
  cd $srcdir/Gravatar-URL-$pkgver
  ./Build install destdir=${pkgdir}
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
