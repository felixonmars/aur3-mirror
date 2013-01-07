# Maintainer: Yuri Bongiorno <yuri.bongiorno /AT\ gmail /DOT| com>

pkgname=scrok-filer
pkgver=1.0.4
pkgrel=1
pkgdesc="A simple file manager for KDE (it's a simple clone of ROX-Filer)."
arch=('i686' 'x86_64')
url='https://opendesktop.org/content/show.php/SCROK-Filer?content=146440'
screenshot='http://kde-apps.org/CONTENT/content-pre1/146440-1.png'
license=('GPL3')
depends=('kdebase-runtime' 'kdebase-lib')
makedepends=('cmake' 'automoc4')
optdepends=('krename')
source=("http://sites.google.com/site/yuribongiorno/${pkgname}_${pkgver}.tar.gz" $pkgname.install)
md5sums=('918e244b5532d456b337078ac406dcec' '027efd4ee6f24da7af118f6f99ef5909')
install=${pkgname}.install

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    ..
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
