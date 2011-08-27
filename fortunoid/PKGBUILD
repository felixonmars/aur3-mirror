#CONTRIBUTOR: Zephyr

pkgname=fortunoid
pkgver=0.2.1
pkgrel=3
pkgdesc="Plasmoid showing a quote using the Fortune Cookie Program"
url="http://www.kde-look.org/content/show.php/fortunoid?content=98838"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-workspace>=4.2.0' 'fortune-mod')
makedepends=('cmake' 'automoc4')
conflicts=()
provides=()
source=("http://www.kde-look.org/CONTENT/content-files/98838-${pkgname}${pkgver}.tar.gz"
	'find-fortune-bin.patch')
md5sums=('c085801520b275ef2c2a675b68fecc96'
	 'db124aae61217b90d182b04cf28459c5')

build() {
  cd ${srcdir}/${pkgname}

  #Fix the fortune binary location problem
  patch -Np0 -i ${srcdir}/find-fortune-bin.patch

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
# vim:syntax=sh
