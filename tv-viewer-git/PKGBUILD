# Contributor: Christian Rapp <crappbytes@gmail.com>
pkgname=tv-viewer-git
pkgver=20131020
pkgrel=1
pkgdesc="TV-Viewer is a frontend to watch and record tv. It supports analog tv and devices with a build-in hardware MPEG-2 encoder. This package provides the latest source code."
arch=('i686' 'x86_64')
url="http://tv-viewer.sourceforge.net/"
license=('GPL')
depends=('tcl' 'tk' 'ivtv-utils' 'mplayer' 'xdg-utils' 'glibc' 'libxdmcp' 'libxau' 'libxcb' 'libx11')
makedepends=('git')
optdepends=(
'tkimg: provides png support for tk < 8.6'
)
#tkimg: If using tk < 8.6 this provides png support
provides=(tv-viewer)
conflicts=(tv-viewer)
options=(!strip)

_gitroot=("https://github.com/crapp/tv-viewer.git")
_gitname=("tv-viewer")

build() {
  cd "$srcdir"
  ## Git checkout
  if [ -d "${srcdir}"/"${_gitname}" ] ; then
    msg "Git checkout:  Updating existing tree"
    cd "${_gitname}" && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone "${_gitroot}"
  fi
  msg "Clone completed"

 ## Create an -build Directory
  rm -rf "${srcdir}"/"${_gitname}"-build
  cp -r "${srcdir}"/"${_gitname}" "${srcdir}"/"${_gitname}"-build
  cd "${srcdir}"/"${_gitname}"-build
  
  msg "configuring build system..."
  chmod a+x ./configure.tcl
  ./configure.tcl --prefix="$pkgdir/usr" --bintarget="/usr/share/tv-viewer" --enable-tclkit=no --nodepcheck --quiet  
}

package() {
  msg "installing files..."
  cd "${srcdir}"/"${_gitname}"-build
  chmod a+x ./install.tcl
  ./install.tcl --quiet
}