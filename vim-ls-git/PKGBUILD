# Maintainer: Josh Klar <j@iv597.com>

pkgname=vim-ls-git
pkgver=20130726
pkgrel=1
pkgdesc="LiveScript support for Vim"
arch=(any)
url="https://github.com/gkz/vim-ls"
license=('wtfpl')
depends=(vim)
makedepends=('git')

_gitroot=https://github.com/gkz/vim-ls.git
_gitname=vim-ls

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
  cd "$srcdir/$_gitname-build"

}

package() {
  cd "${srcdir}/${_gitname}-build"
  mkdir -p "${pkgdir}/usr/share/vim/vimfiles/"
  cp -R compiler ftdetect ftplugin indent syntax  "${pkgdir}/usr/share/vim/vimfiles/"

}

# vim:set ts=2 sw=2 et:
