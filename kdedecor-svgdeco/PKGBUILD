# Contributor: Max Bolotin <mogz@softhome.net>

pkgname="kdedecor-svgdeco"
pkgver=0.0.1
pkgrel=1
pkgdesc="a KDE window decoration"
url="http://kde-look.org/content/show.php?content=23764"
license="GPL"
depends=('kdebase')
makedepends=()
source=(http://kde-look.org/content/files/23764-svgDeco-beta1.tar.bz2)
md5sums=('eb516f8fb5db38caa6eb61fff3a19fc3')

build() {
  cd $startdir/src/svgDeco-beta1
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
