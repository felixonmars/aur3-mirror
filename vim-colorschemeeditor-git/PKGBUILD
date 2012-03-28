# Maintainer: demonicmaniac <namida1@gmx.net>
pkgname=vim-colorschemeeditor-git
pkgver=20120328
pkgrel=1
pkgdesc="PyGTK GUI to more easily create colorschemes"
arch=(any)
url="https://github.com/vim-scripts/ColorSchemeEditor"
license=(custom)
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
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/vim-scripts/ColorSchemeEditor"
_gitname="ColorSchemeEditor"

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
  sed -i -e 's|python\.|python2|' plugin/ColorSchemeEditor.py 
  _vimdir="${pkgdir}/usr/share/vim/vimfiles/"
  for i in {plugin,doc}/*;
  do install -Dm644 ${i} ${_vimdir}/${i};
  done

}

# vim:set ts=2 sw=2 et:
