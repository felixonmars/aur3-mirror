# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=cinnamon-applets-git
pkgver=20120118
pkgrel=1
pkgdesc="Applets for the Cinnamon shell"
arch=('any')
url="https://github.com/linuxmint/cinnamon-applets"
license=('GPL')
depends=('cinnamon-git')
makedepends=('git')
provides=('cinnamon-applets')
conflicts=('cinnamon-applets')

_gitroot='https://github.com/linuxmint/cinnamon-applets.git'
_gitname='cinnamon-applets'

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

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"
}

package() {
  cd "${srcdir}/${_gitname}-build"
  for i in *; do
    if [ -d "${i}" ]; then
      pushd "${i}"
      find -type f -exec install -Dm644 {} "${pkgdir}"/{} \;
      popd
    fi
  done
}

# vim:set ts=2 sw=2 et:
