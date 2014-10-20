# Maintainer: Mr.Elendig <mrelendig@har-ikkje.net>
# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=splintermind-attributes-git
pkgver=20141007.946
pkgrel=1
pkgdesc="A fork of DwarfTherapist, with additional features."
arch=('i686' 'x86_64')
url="https://github.com/splintermind/Dwarf-Therapist"
license=('MIT')
depends=('qt5-script' 'hicolor-icon-theme')
makedepends=('git')
conflicts=('splintermind-attributes-hg')
replaces=('splintermind-attributes-hg')

install=splintermind-attributes.install
source=('splintermind-attributes::git+https://github.com/splintermind/Dwarf-Therapist.git#branch=DF2014'
        'fix_file_path_v3.diff'
        'splintermind-attributes.desktop')
md5sums=('SKIP'
         'bae8ed5dcb94e7735aeb292d43a33a2e'
         '409435078e90f849eece5350a1f71953')

pkgver() {
  cd splintermind-attributes
  _d=$(git log -n 1 --pretty=%ad --date=short | sed 's/-//g')
  _c=$(git log --pretty=%h | wc -l)
  printf '%s.%s' $_d $_c
}

build() {
  cd splintermind-attributes
  # Change to more suitable linux paths
  patch -Np1 < "${srcdir}/fix_file_path_v3.diff"

  # Build
  qmake dwarftherapist.pro
  make
}

package() {
  cd splintermind-attributes
  install -d "${pkgdir}/usr/share/splintermind-attributes/memory_layouts/linux/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 release/DwarfTherapist "${pkgdir}/usr/bin/splintermind-attributes"
  install -Dm644 resources/game_data.ini \
    "${pkgdir}/usr/share/splintermind-attributes/game_data.ini"
  install -Dm644 share/memory_layouts/linux/*.ini \
    "${pkgdir}/usr/share/splintermind-attributes/memory_layouts/linux/"

#  install -Dm644 "${srcdir}"/*.ini \
#    "${pkgdir}/usr/share/dwarftherapist/memory_layouts/linux/"

  install -Dm644 dist/dwarftherapist.desktop \
    "${pkgdir}"/usr/share/applications/splintermind-attributes.desktop
  install -Dm644 resources/img/hammer.png \
    "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/splintermind-attributes.png
}

# vim:set ts=2 sw=2 et:
