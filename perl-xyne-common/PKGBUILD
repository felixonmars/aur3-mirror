#Maintainer: stalker_exe <senokosov8 @ mail . ru>
pkgname=perl-xyne-common
pkgver=2011.03.10.2
pkgrel=1
pkgdesc="Xyne's common Perl modules."
depends=('perl')
arch=('any')
license=('GPL')
url="http://xyne.archlinux.ca/old_projects/${pkgname}"
source=(http://xyne.archlinux.ca/src/$pkgname-$pkgver.tar.gz)
md5sums=('7e14cfc2ae58e4c1fe01aa927a1cf7bb')

build() {
  cd $srcdir/$pkgname
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor 
  make  
  make install DESTDIR=${pkgdir} 

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim: set ts=2 sw=2 et:
