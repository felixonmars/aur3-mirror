# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=kdeplasma-applets-coremoid
pkgver=0.3.1
pkgrel=1
pkgdesc="KDE plasma applet to set cpufreq governor, display the CPU usage and the current clock rate on dynamic governors"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/CoreMoid?content=72789"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasmoid-coremoid')
replaces=('plasmoid-coremoid')
source=("http://www.hirnfrei.org/~joerg/coremoid/coremoid-$pkgver.tar.bz2")
md5sums=('053307f6ea5ff5490793690ea38b92da')

build() {
  # elsixdiab's fix for error: FindPlasma.cmake is deprecated
  cd coremoid-${pkgver}
  sed -i -e "s/find_package(Plasma REQUIRED)//" CMakeLists.txt
  sed -i -e "s/PLASMA_LIBS/KDE4_PLASMA_LIBS/" CMakeLists.txt
  
  # fix for error: self is not a member of Plasma::Theme
  sed -i -e "s|m_textColor = Plasma::Theme::self()->textColor();|m_textColor = Plasma::Theme::defaultTheme()->color(Plasma::Theme::TextColor);|g" coremoidapplet.cpp
  sed -i -e "s|m_boxColor = Plasma::Theme::self()->backgroundColor();|m_boxColor = Plasma::Theme::defaultTheme()->color(Plasma::Theme::BackgroundColor);|g" coremoidapplet.cpp
  cd ..

  mkdir build
  cd build
  cmake ../coremoid-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}

