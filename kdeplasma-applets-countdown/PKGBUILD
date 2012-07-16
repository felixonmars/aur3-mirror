# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-countdown
pkgver=0.2.2
pkgrel=1
pkgdesc="A Countdown plasmoid for KDE"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=74950"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('kdeplasma-countdown')
replaces=('kdeplasma-countdown')
source=("http://ppa.launchpad.net/andersin/ubuntu/pool/main/p/plasmoid-countdown/plasmoid-countdown_${pkgver}.orig.tar.gz"
	'kde4.3.patch')
md5sums=('ec57131898236963ba118bf660aa0452'
         'd505acceb06e3b598b11ae8eb99f7b9c')

build() {
  cd plasmoid-countdown-${pkgver}
  patch -Np1 -i "${srcdir}"/kde4.3.patch
  cd ..

  mkdir build
  cd build
  cmake ../plasmoid-countdown-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
