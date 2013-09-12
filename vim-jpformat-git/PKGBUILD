# Contributor: 7kry <kt[at]7kry.net>
pkgname=vim-jpformat-git
pkgver=123
pkgrel=1
pkgdesc="Format plugin for Vim, which supports Japanese hyphenation."
arch=(any)
url="https://github.com/fuenor/JpFormat.vim"
license=('custom')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_gitroot="https://github.com/fuenor/JpFormat.vim"
_gitname="jpformat"

build() {
  cd "$srcdir" msg "Connecting to GIT server...."

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
  rm README.md

  install -d ${pkgdir}/usr/share/vim/vimfiles
  cp -R --preserve=mode * ${pkgdir}/usr/share/vim/vimfiles

  # author doesn't provide any license file.
}
