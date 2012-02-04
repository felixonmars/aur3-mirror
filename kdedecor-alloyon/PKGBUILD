# Contributor: Max Bolotin <mogz@softhome.net>

pkgname="kdedecor-alloyon"
pkgver=0.2
pkgrel=2
pkgdesc="a KDE window decoration"
url="http://www.kde-look.org/content/show.php/Alloyon?content=11231"
license="GPL"
depends=('kdebase' 'kdelibs')
makedepends=()
source=(http://www.kde-look.org/CONTENT/content-files/11231-alloyon-0.2.tar.bz2)
md5sums=('681a898ed02167ca3d7f8c668d1439b3')

build() {
  cd $startdir/src/alloyon-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
