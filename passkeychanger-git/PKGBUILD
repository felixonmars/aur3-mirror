# Maintainer: Artem A. Klevtsov unikum.pm@gmail.com
pkgname=passkeychanger-git
_pkgname=PasskeyChanger
pkgver=20110726
pkgrel=1
pkgdesc="This is program for change passkey in torrent files."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/PasskeyChanger?content=143953"
license=('GPL3')
depends=('qt')
makedepends=('git' 'cmake')

_gitroot="git://github.com/panter-dsd/${_pkgname}"
_gitname="${_pkgname}"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd ${_gitname}
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  if [ -d "${srcdir}/${_gitname}/build" ]; then
    rm -rf "${srcdir}/${_gitname}/build"
  fi
  mkdir "${srcdir}/${_gitname}/build"
  cd "${srcdir}/${_gitname}/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  install -Dm 755 passkeychanger ${pkgdir}/usr/bin/passkeychanger
} 
