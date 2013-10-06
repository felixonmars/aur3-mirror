# Maintainer: Mr.Elendig <mrelendig@har-ikkje.net>
# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=splintermind-attributes-hg
pkgver=580
pkgrel=2
pkgdesc="A fork of DwarfTherapist, with additional features."
arch=('i686' 'x86_64')
url="https://code.google.com/r/splintermind-attributes"
license=('MIT')
depends=('qt5-script' 'hicolor-icon-theme')
makedepends=('mercurial')
install=splintermind-attributes.install
source=('hg+https://code.google.com/r/splintermind-attributes'
        'fix_file_path_v2.diff'
        'splintermind-attributes.desktop')
md5sums=('SKIP'
         '49b0891003ab10722fa5db00edb65740'
         '409435078e90f849eece5350a1f71953')

pkgver() {
  cd splintermind-attributes
  hg log -l 1 --template '{rev}'
}

build() {
  cd splintermind-attributes
  # Change to more suitable linux paths
  patch -Np1 < "${srcdir}/fix_file_path_v2.diff"

  # Build
  qmake dwarftherapist.pro
  make
}

package() {
  cd splintermind-attributes
  install -d "${pkgdir}/usr/share/splintermind-attributes/memory_layouts/linux/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/release/DwarfTherapist "${pkgdir}/usr/bin/splintermind-attributes"
  install -Dm644 etc/game_data.ini \
    "${pkgdir}/usr/share/splintermind-attributes/game_data.ini"
  install -Dm644 etc/memory_layouts/linux/*.ini \
    "${pkgdir}/usr/share/splintermind-attributes/memory_layouts/linux/"

#  install -Dm644 "${srcdir}"/*.ini \
#    "${pkgdir}/usr/share/dwarftherapist/memory_layouts/linux/"

  install -Dm644 "${srcdir}"/splintermind-attributes.desktop\
    "${pkgdir}"/usr/share/applications/splintermind-attributes.desktop
  install -Dm644 img/hammer.png \
    "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/splintermind-attributes.png
}

# vim:set ts=2 sw=2 et:
