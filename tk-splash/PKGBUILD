# Maintainer: Archie <xMickael@ifrance.com>

pkgname=tk-splash
pkgver=0.14
pkgrel=2
pkgdesc="create a splash screen "
depends=('tk')
arch=('i686')
license=('GPL')
source=(http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/Tk-Splash-$pkgver.tar.gz)
url="http://search.cpan.org/~srezic/Tk-Splash/"
md5sums=('6e99ee50ce64fec15526b5bb3d950601')

build() {
  cd $startdir/src/Tk-Splash-$pkgver
  perl Makefile.PL
  make || return 1
  make DESTDIR=$startdir/pkg/ install
  /usr/bin/find $startdir/pkg -name '.packlist' -exec rm '{}' \;
  /usr/bin/find $startdir/pkg -name 'perllocal.pod' -exec rm '{}' \;
}
