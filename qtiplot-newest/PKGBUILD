# Maintainer: b00rt00s <bomby.zrzuc@gmail.com>

pkgname=qtiplot-newest
_pkgname=qtiplot
pkgver=0.9.8.6
pkgrel=1
pkgdesc="Data analysis and scientific plotting - free clone of Origin"
arch=('i686' 'x86_64')
url="http://soft.proindependent.com/qtiplot.html"
provides=('qtiplot')
conflicts=('qtiplot')
depends=('muparser' 'gsl' 'python2-pyqt' 'boost-libs' 'shared-mime-info' 'mesa' 'qt-assistant-compat')
# build wihout liborigin. There are no suitable sources in v. 0.9.8.5. Anyone knows how to handle it?
# build against qwtplot3d provided in the package
# build against qwt provided in the package
# linked statically against tamu anova
# linked statically against alglib
# linked statically against quazip
# linked statically against QTeXEngine
makedepends=('pkg-config' 'boost')
license=('GPL2')
install=${_pkgname}.install
source=(http://download.berlios.de/qtiplot/qtiplot-${pkgver}.tar.bz2 
	http://www.stat.tamu.edu/~aredd/tamuanova/tamu_anova-0.2.tar.gz
	http://www.alglib.net/translator/re/alglib-2.6.0.cpp.zip
	http://downloads.sourceforge.net/project/quazip/quazip/0.3/quazip-0.3.tar.gz
	http://download.berlios.de/qtiplot/QTeXEngine-0.3-opensource.zip
	qtiplot.desktop
        qtiplot.png
        qtiplot.xml
	build.conf.archlinux)

md5sums=('38a662dc7ce641f9fa92fa5e8134c157'
	 'a98f9703d66a9da8c6458b7a643ada30'
	 'cec14e4d399f01a6f68eecc0b44ebe7d'
	 '7f4792471e8ac713f19a086638a17816'
	 'd1b234623770ec6209b14d1b5137f2f1'
	 '56bd53f4f1367c285086acb969f13348'
	 'ad8affbd6f0d5cbdcde46c923ee2668a'
         '35683f3b32e1edcca0bb02c471d284e9'
	 'd42576ab5d706769296f2dbe9853fa3f')

build() {

  # Make QTeXEngine
  msg "Make QTeXEngine"
  cd ${srcdir}/QTeXEngine
  qmake || return 1
  make || make || return 1  #this is not mistake. make sometimes fails when run first time
  ln -sf ${srcdir}/QTeXEngine ${srcdir}/${_pkgname}-${pkgver}/3rdparty


  # Make TAMUANOVA
  msg "Make tamu anova"
  cd ${srcdir}/tamu_anova-0.2
  ./autogen.sh || return 1
  ./configure || return 1
  make || return 1
  ln -sf ${srcdir}/tamu_anova-0.2 ${srcdir}/${_pkgname}-${pkgver}/3rdparty/tamu_anova


  # Make alglib
  msg "Make alglib"
  cd ${srcdir}/cpp
  chmod +x build
  sh build gcc || return 1
  ln -sf ${srcdir}/cpp/out ${srcdir}/${_pkgname}-${pkgver}/3rdparty/alglib


  #Make quazip
  cd ${srcdir}/quazip-0.3/quazip
  qmake || return 1
  make || return 1
  make staticlib || return 1
  mkdir -p ${srcdir}/${_pkgname}-${pkgver}/3rdparty/quazip/lib
  install libquazip.a ${srcdir}/${_pkgname}-${pkgver}/3rdparty/quazip/lib/libquazip.a


  cd ${srcdir}/${_pkgname}-${pkgver}
  # Make qwt
  msg "Make qwt"
  cd ./3rdparty/qwt
  qmake || return 1
  make || return 1


  # Make qwtplot3d
  msg "Make qwtplot3d"
  cd ../qwtplot3d
  echo "unix:CONFIG += staticlib" >> qwtplot3d.pro
  qmake || return 1
  make || return 1



  # Make qtiplot
  msg "Finally make qtiplot"
  cd ${srcdir}/${_pkgname}-${pkgver}/qtiplot
  cp ${srcdir}/build.conf.archlinux ../build.conf

  sed -i 's|/usr/local/|/usr/share/|' qtiplot.pro
  sed -i 's|<QAssistantClient>|<QtAssistant/qassistantclient.h>|' src/core/ApplicationWindow.cpp
  sed -i 's#d_python_config_folder + "#"/usr/share/qtiplot#' src/core/ApplicationWindow.cpp

  qmake qtiplot.pro QMAKESPEC=linux-g++ || return 1
  make QTDIR=/usr/ QMAKESPEC=linux-g++  || return 1
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/qtiplot
  INSTALL_ROOT=${pkgdir} make install || return 1

  # make it nice:
  install -D -m644 ${srcdir}/qtiplot.png \
  	${pkgdir}/usr/share/pixmaps/qtiplot.png || return 1
  install -D -m644 ${srcdir}/qtiplot.desktop \
  	${pkgdir}/usr/share/applications/qtiplot.desktop || return 1
  install -D -m644 ${srcdir}/qtiplot.xml \
        ${pkgdir}/usr/share/mime/packages/qtiplot.xml || return 1
}


