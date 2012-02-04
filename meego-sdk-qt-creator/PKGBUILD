# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sdk-qt-creator
pkgver=2.1.0
pkgrel=2
_rpmver=3.5
pkgdesc='Lightweight integrated development environment (IDE) for Qt'
arch=('i686' 'x86_64')
url='http://meego.gitorious.com/meego-developer-tools/qt-creator'
license=('LGPL2.1')
depends=('meego-sdk-attica')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/${pkgname}-${pkgver}-${_rpmver}.src.rpm")
md5sums=('2a213a33365f2320b33474f6f9ac83d8')

build() {
  cd "${srcdir}"
  bunzip2 -d meego-2.1_20110505.patch.bz2
  bunzip2 -d buildservice_plugin_20110104.patch.bz2
  tar -zxf qt-creator-${pkgver}-src.tar.gz

  cd qt-creator-${pkgver}-src
  patch -p1 -i ../meego-2.1_20110505.patch
  patch -p1 -i ../buildservice_plugin_20110104.patch

  export PKG_CONFIG_PATH=/opt/meego/attica/lib/pkgconfig
  cp -rf src/plugins/qt4projectmanager/qt-maemo/images \
    src/plugins/qt4projectmanager/qt-meego/

  cp "${srcdir}"/mtf.png src/plugins/qt4projectmanager/wizards/images/

  meego-sdk-qmake IDE_LIBRARY_BASENAME=lib
  make -j4
}

package() {
  cd "${srcdir}"/qt-creator-${pkgver}-src
  export LD_LIBRARY_PATH=/opt/meego/meego-sdk-qt/lib/:$LD_LIBRARY_PATH
  export QT_PLUGIN_PATH=/opt/meego/meego-sdk-qt/lib/qt4/plugins

  make INSTALL_ROOT="${pkgdir}"/opt/meego/${pkgname} install

  install -D -p -m755 "${srcdir}"/meego-sdk-qtcreator.sh \
    "${pkgdir}"/opt/meego/${pkgname}/bin/meego-sdk-qtcreator
  
  mkdir -p "${pkgdir}"/opt/meego/"${pkgname}"/share/mime/packages
  cp -a "${srcdir}"/Nokia-QtCreator.xml "${pkgdir}"/opt/meego/"${pkgname}"/share/mime/packages/
  mkdir -p "${pkgdir}"/opt/meego/"${pkgname}"/share/applications
  cp -a "${srcdir}"/qtcreator.desktop "${pkgdir}"/opt/meego/"${pkgname}"/share/applications/

  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/mime/packages
  mkdir -p "${pkgdir}"/usr/share/applications
  mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}/
  ln -sf /opt/meego/${pkgname}/bin/meego-sdk-creator \
    "${pkgdir}"/usr/bin/meego-sdk-qtcreator
  ln -sf /opt/meego/${pkgname}/share/mime/packages/Nokia-QtCreator.xml \
    "${pkgdir}"/usr/share/mime/packages/meego-Nokia-QtCreator.xml
  ln -sf /opt/meego/${pkgname}/share/applications/qtcreator.desktop \
    "${pkgdir}"/usr/share/applications/meego-sdk-qtcreator.desktop

  ln -sf /opt/meego/${pkgname}/qtcreator/gdbmacros/LGPL_EXCEPTION.TXT \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
