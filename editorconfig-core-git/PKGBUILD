# Maintainer: Erik van der Kolk <developer at smerik dot nl>
pkgname=editorconfig-core-git
pkgver=20121215
pkgrel=2
pkgdesc="EditorConfig core code written in C (for use by plugins supporting EditorConfig parsing)"
arch=('i686' 'x86_64')
url="https://github.com/editorconfig/editorconfig-core"
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake>=2.6')
provides=('editorconfig-core')
conflicts=('editorconfig-core')
changelog=CHANGELOG
md5sums=('SKIP')

_gitroot="git://github.com/editorconfig"
_gitname="editorconfig-core"

build() {
  cd "${srcdir}"

  msg "Checking for local Git repository..."
  if [[ -d "${srcdir}/${_gitname}" ]] ; then
    msg "Local repository found: let's fetch & merge from remote..."
    cd "${_gitname}"
    git pull origin --recurse-submodules
  else
    msg "No local repository found: start cloning remote..."
    git clone "${_gitroot}/${_gitname}.git" --recurse-submodules
  fi
  msg "Git workout done."

  cd "${srcdir}/${_gitname}"

  msg "Starting make..."
  cmake -D CMAKE_INSTALL_PREFIX=/usr .
  make

  msg "Including license..."
  install -v -D -m 644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${srcdir}/${_gitname}"
  make test
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
