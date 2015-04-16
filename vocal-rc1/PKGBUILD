# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Nathan Dyer <https://launchpad.net/~nathandyer>

pkgname=vocal-rc1
pkgver=r275
pkgrel=1
pkgdesc='Vocal Podcast Manager. Simple Podcast Client for the Modern Desktop.'
arch=('i686' 'x86_64')
url='http://www.vocalproject.net/'
license=('GPL3')
depends=('libnotify' 'libunity' 'libxml2' 'granite' 'gtk3' 'gstreamer' 'sqlite3' 'clutter-gtk' 'icu<54.1')
makedepends=('bzr' 'vala' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
_sourcefile=vocal_10_RC_tar.gz
source=("http://www.vocalproject.net/s/"${_sourcefile})
sha256sums=('SKIP')

_foldername="vocal-1.0+r267"



build() {
  #mkdir "${srcdir}/${_foldername}"
  tar -xf "${_sourcefile}" -C "${srcdir}"
  cd ${_foldername}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${_foldername}/build

  make DESTDIR="${pkgdir}" install

}

# vim: ts=2 sw=2 et:
