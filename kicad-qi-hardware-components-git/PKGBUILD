pkgname=kicad-qi-hardware-components-git
pkgver=20111116
pkgrel=1
pkgdesc="Kicad libraries from http://projects.qi-hardware.com."
arch=('any')
url="http://projects.qi-hardware.com"
license=('custom')
depends=('kicad')
makedepends=('git-core' 'fped')
options=(!strip)
source=()

_gitroot="git://projects.qi-hardware.com/kicad-libs.git"
_gitname=${pkgname}

package() {
  installdir="${pkgdir}/usr/share/kicad/"
  builddir="${srcdir}/${_gitname}-build/"

  if [ -d ${srcdir}/${_gitname} ]
  then
    msg "Updateing local repository..."
    cd ${_gitname}
    git pull origin master || return 1
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "git checkout done or server timeout"
  msg "Starting make..."

  mkdir ${builddir} || true
  cp -r ${srcdir}/${_gitname}/{Makefile,components,modules} ${builddir}
  cd ${builddir}

  make

  install -dm755 "${installdir}library" "${installdir}modules/"
  install -Dm755 -t "${installdir}library/" ${builddir}components/*.lib
  install -Dm755 -t "${installdir}modules/" ${builddir}modules/*.mod
}

# vim:set ts=2 sw=2 et:
