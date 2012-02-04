#Maintainer: stalker_exe <senokosov8 @ mail . ru>
pkgname=perl-xyne-arch
pkgver=2011.03.10.6
pkgrel=1
pkgdesc="Xyne's Arch-specific Perl modules."
depends=('perl' 'perl-libwww' 'perl-xyne-common>=1.0.3' 'pacman')
optdepends=('sudo' 'perl-crypt-ssleay: for reflector support' 'python: for rankmirrors support')
arch=('any')
license=('GPL')
url="http://xyne.archlinux.ca/old_projects/${pkgname}"
source=(http://xyne.archlinux.ca/src/$pkgname-$pkgver.tar.gz)
md5sums=('3dc03f2280eca8d5bd7eaf5891d03ce5')

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
