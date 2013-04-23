# Maintainer: Dreieck

pkgname=qt4-qt-symlinks
pkgver=4.8.4
pkgrel=2
arch=('any')
url='http://www.example.com/just_a_qt4_to_qt_wrapper/'
license=('GPL3')
pkgdesc="Provides dependency for 'qt' by providing symlinks from qt4 to qt. PLEASE READ PKGBUILD!"

install="${pkgname}.install"
depends=("qt4=${pkgver}")
replaces=('qt<=4.8.4')
provides=("qt=${pkgver}")
conflicts=("qt" "qt5-base>=5.0.2")
source=("${install}")
md5sums=('1910e357b7230d645c4ad619b3dd9678')


### Lists qt4 file names.
_qt4paths=("/usr/share/qt4" "/usr/lib/qt4" "/usr/bin/assistant-qt4" "/usr/bin/designer-qt4" "/usr/bin/lconvert-qt4" "/usr/bin/linguist-qt4" "/usr/bin/lrelease-qt4" "/usr/bin/lupdate-qt4" "/usr/bin/moc-qt4" "/usr/bin/pixeltool-qt4" "/usr/bin/qcollectiongenerator-qt4" "/usr/bin/qdbus-qt4" "/usr/bin/qdbuscpp2xml-qt4" "/usr/bin/qdbusviewer-qt4" "/usr/bin/qdbusxml2cpp-qt4" "/usr/bin/qdoc3-qt4" "/usr/bin/qhelpconverter-qt4" "/usr/bin/qhelpgenerator-qt4" "/usr/bin/qmake-qt4" "/usr/bin/qmlplugindump-qt4" "/usr/bin/qmlviewer-qt4" "/usr/bin/qt3to4-qt4" "/usr/bin/qtconfig-qt4" "/usr/bin/qttracereplay-qt4" "/usr/bin/rcc-qt4" "/usr/bin/uic-qt4" "/usr/bin/uic3-qt4" "/usr/bin/xmlpatterns-qt4" "/usr/bin/xmlpatternsvalidator-qt4")

### Lists the corresponding qt file names. Order has to be the same as in '_qt4paths'!
_qtpaths=("/usr/share/qt" "/usr/lib/qt" "/usr/bin/assistant" "/usr/bin/designer" "/usr/bin/lconvert" "/usr/bin/linguist" "/usr/bin/lrelease" "/usr/bin/lupdate" "/usr/bin/moc" "/usr/bin/pixeltool" "/usr/bin/qcollectiongenerator" "/usr/bin/qdbus" "/usr/bin/qdbuscpp2xml" "/usr/bin/qdbusviewer" "/usr/bin/qdbusxml2cpp" "/usr/bin/qdoc3" "/usr/bin/qhelpconverter" "/usr/bin/qhelpgenerator" "/usr/bin/qmake" "/usr/bin/qmlplugindump" "/usr/bin/qmlviewer" "/usr/bin/qt3to4" "/usr/bin/qtconfig" "/usr/bin/qttracereplay" "/usr/bin/rcc" "/usr/bin/uic" "/usr/bin/uic3" "/usr/bin/xmlpatterns" "/usr/bin/xmlpatternsvalidator")

### Handle /usr/include seperately, since there we need to link '/usr/include/qt4/* -> /usr/include/'.
_qt4include="/usr/include/qt4"
_qtinclude="/usr/include"


build() {
  true
}

package() {
  cd "${pkgdir}"
  
  for _qtpathindex in "${!_qt4paths[@]}"; do
    cd "${pkgdir}" || exit 11
    _qt4path="${_qt4paths[_qtpathindex]}"
    _qtpath="${_qtpaths[_qtpathindex]}"
    mkdir -p "$(dirname ./"${_qtpath}")" || exit 41
    ln -sv "${_qt4path}" ./"${_qtpath}" || exit 21
  done

  cd "${pkgdir}" || exit 11
  mkdir -p ./"${_qtinclude}" || exit 41
  ln -sv "${_qt4include}"/* ./"${_qtinclude}"/ || exit 31

  cd "${pkgdir}"
}

