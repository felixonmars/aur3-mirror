# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=dobeedo
pkgver=0.3.0
pkgrel=2
pkgdesc="A todo list manager for KDE that tries to be easy and fast to use"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/DoBeeDo?content=123338"
license=('GPL')
depends=('kdebase-runtime' 'hicolor-icon-theme')
makedepends=('cmake' 'wget' 'automoc4')
#source=("http://github.com/downloads/Fxrh/DoBeeDo/DoBeeDo-${pkgver}.tar.gz")
#md5sums=('a436b8b197875bb697858e3494af42a8')

build() {
  # need this because of a bug in wget
  wget https://github.com/downloads/Fxrh/DoBeeDo/DoBeeDo-${pkgver}.tar.gz --no-check-certificate || return 1
  tar xzf DoBeeDo-${pkgver}.tar.gz -C ${srcdir}/ || return 1

  cd ${srcdir}/DoBeeDo-${pkgver}
  mkdir -p build
  cd build
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package() {
  cd ${srcdir}/DoBeeDo-${pkgver}/build
  make DESTDIR=${pkgdir} install || return 1
} 
