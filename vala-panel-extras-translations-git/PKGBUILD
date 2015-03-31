# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_pkgname=vala-panel-extras
pkgname=${_pkgname}-translations-git
_cmakename=cmake-vala
pkgver=0.1.0.r2.g6a7bf4f
pkgrel=1
pkgdesc="Translations for vala-panel-extras"
url="https://github.com/rilian-la-te/vala-panel-extras"
arch=('any')
license=('GPL3')
makedepends=('cmake' 'vala' 'gettext' 'gtk3')
optdepends=('vala-panel-extras-volume: translate this'
            'vala-panel-extras-battery: translate this'
            'vala-panel-extras-weather: translate this'
            'vala-panel-extras-xkb: translate this')
source=("git://github.com/rilian-la-te/${_pkgname}.git"
        "git://github.com/rilian-la-te/${_cmakename}.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_cmakename}"
  cp -r . "${srcdir}/${_pkgname}/cmake"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_WEATHER=OFF -DENABLE_ALSA=OFF -DENABLE_XKB=OFF -DENABLE_BATTERY=OFF
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}


