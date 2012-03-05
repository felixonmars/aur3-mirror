# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: snyh <snyh@snyh.org>
pkgname=vim-less-git
pkgver=20120305
pkgrel=1
pkgdesc="This vim bundle adds syntax highlighting, indenting and autocomplete for the dynamic stylesheet language LESS"
arch=(any)
url="https://github.com/groenewege/vim-less"
license=(custom)
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=('vim-less')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/groenewege/vim-less.git"
_gitname="vim-less"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  _vimdir="${pkgdir}/usr/share/vim/vimfiles/"
  install -Dm644 ftdetect/less.vim ${_vimdir}/ftdetect/less.vim
  install -Dm644 ftplugin/less.vim ${_vimdir}/ftplugin/less.vim
  install -Dm644 indent/less.vim ${_vimdir}/indent/less.vim
  install -Dm644 syntax/less.vim ${_vimdir}/syntax/less.vim
}

# vim:set ts=2 sw=2 et:
