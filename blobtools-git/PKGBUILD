# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=blobtools-git
pkgver=20111228
pkgrel=1
pkgdesc="Tools used for unpacking and repacking blob files."
arch=('i686' 'x86_64')
url="https://github.com/AndroidRoot/BlobTools"
license=('GPL')
depends=()
makedepends=('git')
provides=('blobtools')
conflicts=('blobtools')

_gitroot='https://github.com/AndroidRoot/BlobTools.git'
_gitname='blobtools'

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rvf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"

  install -dm755 "${pkgdir}/usr/bin/"
  install -m755 bin/blobunpack "${pkgdir}/usr/bin/"
  install -m755 bin/blobpack "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
