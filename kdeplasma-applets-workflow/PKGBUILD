# Maintainer: t3ddy <t3ddy1988 "at" gmail {dot} com>

pkgname=kdeplasma-applets-workflow
pkgver=0.4.1
pkgrel=1
name=plasmoid-workflow
pkgdesc="A KDE Plasmoid that integrates Activities, Virtual Desktops and Tasks Functionalities from Plasma Desktop in just one component."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/WorkFlow+Plasmoid?content=147428"
license=('GPL')
depends=('kdebase-workspace>=4.8')
makedepends=('gcc' 'cmake' 'automoc4')
source=("http://opentoolsandspace.org/Art/WorkFlow/0.4.x/${name}-${pkgver}.tar.gz")
md5sums=('90bd8b29175cd49726980707ff384e81')

build() {
  cd ${srcdir}/${name}-${pkgver}
  
  mkdir build && cd build
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${srcdir}/${name}-${pkgver}/build

  make DESTDIR="$pkgdir/" install
}
