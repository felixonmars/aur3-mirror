# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sdk-qt-tools
pkgver=4.7.2
pkgrel=1
_rpmver=2.11
pkgdesc="Qt tools for MADDE"
arch=('i686' 'x86_64')
url="http://qt.nokia.com/"
license=('LGPL2')
depends=('madde' 'meego-sdk-libmeegotouch')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/qt-tools-${pkgver}-${_rpmver}.src.rpm")
md5sums=('318d9471b29c73bca8305c8be1777757')

package() {
  cd "${srcdir}"

  for file in lupdate mgen mmoc; do
    install -Dm755 "${srcdir}"/${file}.sh "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/bin/${file}
  done

  for file in lrelease moc qdbusxml2cpp qmake rcc uic; do
    ln -sf /opt/meego/meego-sdk-qt/bin/${file} "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/bin/${file}
  done

  ln -sf /opt/meego/meego-sdk-qt/bin/lupdate "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/bin/lupdate.bin
  ln -sf /usr/bin/mgen "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/bin/mgen.bin
  ln -sf /usr/bin/mmoc "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/bin/mmoc.bin
  ln -sf /usr/bin/mmoc.pl "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/bin/mmoc.pl

  install -d "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/lib
  ln -sf /opt/meego/meego-sdk-qt/lib/libQtCore.so.* \
    "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/lib
  ln -sf /opt/meego/meego-sdk-qt/lib/libQtDBus.so.* \
    "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/lib
  ln -sf /opt/meego/meego-sdk-qt/lib/libQtXml.so.* \
    "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/qt-tools-4.7-linux_${CARCH}/lib

  cd "${pkgdir}"/usr/lib/madde/linux-${CARCH}/tools/
  for v in 0 1 2; do
    ln -s qt-tools-4.7-linux_${CARCH} qt-tools-4.7.${v}-linux_${CARCH}
  done
}
