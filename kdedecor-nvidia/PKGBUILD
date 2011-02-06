# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdedecor-nvidia
pkgver=1.0
_pkgver=3.2.0
pkgrel=1
pkgdesc="NVIDIA KDE theme"
url="http://www.kde-look.org/content/show.php?content=12330"
license=('GPL')
arch=('i686')
depends=(kdelibs)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(ftp://ftp.berlios.de/pub/assk/nvidia-$pkgver-$_pkgver.tar.bz2)

build() {
  cd $startdir/src/home/junior/ProyectoKwin/pack/nvidia-$pkgver-$_pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('b230b4fe927c8a0f26ab1af833b61161')
