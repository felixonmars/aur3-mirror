# Maintainer: Jan Tylich (Kurt) <jan.tylich (at) gmail.com>
pkgname=performance_mx_dpi-git
pkgver=20121228
pkgrel=1
pkgdesc="Logitech Performance Mouse MX support for setting its DPI (LED indicated)"
arch=(x86_64 i686)
url="https://github.com/joelpet/logitech-mx-performance-dpi"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
optdepends=(
#'pairingtool:	Tool to pair Logitech devices to unifying receiver'
#'volctl2:	A volume control daemon designed to work with a Logitech Performance MX'
)
source=()
noextract=()

_gitroot="https://github.com/joelpet/logitech-mx-performance-dpi"
_gitname="logitech-mx-performance-dpi"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  make

}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p ${pkgdir}/usr/bin
  cp performance_mx_dpi performance_mx_dpi.o ${pkgdir}/usr/bin
  chmod +x *
} 