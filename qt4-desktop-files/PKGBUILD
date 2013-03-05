# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=qt4-desktop-files
pkgver=4.8.4
pkgrel=2
pkgdesc="Desktop files for Qt4"
arch=('any')
url="http://qt-project.org"
license=('GPL3')
depends=('qt4')
install="qt4-desktop-files.install"
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=(http://releases.qt-project.org/qt4/source/${_pkgfqn}.tar.gz
        assistant-qt4.desktop
        designer-qt4.desktop
        linguist-qt4.desktop)
sha256sums=('33b0e38ba4c54a0cf8a4be8ca5a4584f1c2e0adfecb57b21d9d1d267b0093270'
            '5361ba4d5a3562b5ee9bf60952a84f20956953a122f7f3c59a89099080cd5c7a'
            'd9e6023248794f8eea5d39a246471bc4ebac26176e71397ec71e73f0a7436976'
            '828ba71fcf1a9bcdf591f672d63347efdabd896d396bd33595025349067e2dff')

package() {
  cd "${srcdir}/${_pkgfqn}"

  for icon in tools/linguist/linguist/images/icons/linguist-*-32.png ; do
    size=$(echo $(basename ${icon}) | cut -d- -f2)
    install -D -m644 ${icon} \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/linguist-qt4.png"
  done

  # Install icons
  install -D -m644 src/gui/dialogs/images/qtlogo-64.png \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/qtlogo-qt4.png"

	install -D -m644 tools/assistant/tools/assistant/images/assistant.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/assistant-qt4.png"

  install -D -m644 tools/assistant/tools/assistant/images/assistant-128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/assistant-qt4.png"

  install -D -m644 tools/designer/src/designer/images/designer.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/designer-qt4.png"

  # Install desktop files
  install -d "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}"/{linguist-qt4,designer-qt4,assistant-qt4}.desktop \
    "${pkgdir}/usr/share/applications/"
}

# vim: set ts=2 sw=2 ft=sh noet:
