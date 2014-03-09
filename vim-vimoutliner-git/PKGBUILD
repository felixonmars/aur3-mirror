# Maintainer: arno <youremail@domain.com>
# Original Contributor: ops <oliverDOTsherouseATgmailDOTcom>
pkgname=vim-vimoutliner-git
_pkgname=vim-vimoutliner
pkgver=20140307
pkgrel=1
pkgdesc="Vim Outline processor"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=3515"
license=('GPL3')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=('vim-vimoutliner' 'vimoutliner')
conflicts=('vim-vimoutliner' 'vimoutliner')
replaces=()
backup=()
options=()
install=vimdoc.install
source=()
noextract=()

_gitroot=https://github.com/vimoutliner/vimoutliner.git
_gitname=vimoutliner

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --branch development --single-branch \
      "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

function copydir {
  files=`ls $1`
  for i in $files; do 
    if [[ -d $1/$i ]]; then
      copydir $1/$i $2/$i
    else
      install -Dm644 $1/$i $2/$i
    fi
  done
}

package() {
  cd "$srcdir/$_gitname-build"

  docdir="$pkgdir/usr/share/doc/$_pkgname"
  install -d $docdir
  install -m644 CHANGELOG INSTALL LICENSE README TODO.otl \
    $docdir

  vimdir="$pkgdir/usr/share/vim/vimfiles"
  for d in doc ftdetect ftplugin syntax vimoutliner; do
    copydir "$d" "$vimdir/$d"
  done
  install -m644 vimoutlinerrc "$vimdir/vimoutliner"
}

# vim:set ts=2 sw=2 et:
