pkgname=kdedecor-dekorator
pkgver=0.3
pkgrel=1
pkgdesc="DeKorator KDE window decoration"
license=('GPL')
arch=(i686 x86_64)
url="http://www.kde-look.org/content/show.php?content=31447"
depends=('sysfsutils>=2.0.0-1')
makedepends=('perlxml')
source=(http://www10.frugalware.org/pub/linux/frugalware/frugalware-stable/source/kde-extra/dekorator/dekorator-${pkgver}.tar.gz)
md5sums=('b527b33645a69cba5662b3d7f31f9245')
build() {
  cd ${startdir}/src/dekorator-${pkgver}
  ./configure --prefix=/usr 
  make || return 1 
  make DESTDIR=${startdir}/pkg install 
}
