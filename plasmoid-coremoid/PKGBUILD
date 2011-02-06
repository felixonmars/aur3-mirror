# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=plasmoid-coremoid
pkgver=0.3.1
pkgrel=2
pkgdesc="KDE 4 Plasma applet to set cpufreq governor, display the CPU usage and the current clock rate on dynamic governors"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/CoreMoid?content=72789"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
source=(http://www.hirnfrei.org/~joerg/coremoid/coremoid-$pkgver.tar.bz2)
md5sums=('053307f6ea5ff5490793690ea38b92da')

build() {
  cd $startdir/src/coremoid-$pkgver

  # elsixdiab's fix for error: FindPlasma.cmake is deprecated
  sed -i -e "s/find_package(Plasma REQUIRED)//" CMakeLists.txt
  sed -i -e "s/PLASMA_LIBS/KDE4_PLASMA_LIBS/" CMakeLists.txt
  # fix for error: ‘self’ is not a member of ‘Plasma::Theme’
  sed -i -e "s|m_textColor = Plasma::Theme::self()->textColor();|m_textColor = Plasma::Theme::defaultTheme()->color(Plasma::Theme::TextColor);|g" coremoidapplet.cpp
  sed -i -e "s|m_boxColor = Plasma::Theme::self()->backgroundColor();|m_boxColor = Plasma::Theme::defaultTheme()->color(Plasma::Theme::BackgroundColor);|g" coremoidapplet.cpp
  
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR=$pkgdir install
}

