# Maintainer: wido <widomaker2k7@gmail.com>

pkgname=vimmpc-git
_pkgname=vimmpc
pkgver=20101020
pkgrel=1
pkgdesc="MPD controller from within Vim"
url="http://gavin.brokentrain.net/projects/vimmpc/"
license=("GPL")
arch=('any')
conflicts=('vimmpc')
provides=('vimmpc')
depends=('mpc' 'gvim' 'python-mpd' 'python2')
install=vimdoc.install
#source=(http://svn.navi.cx/misc/trunk/python/bemused/mpdclient2.py)
md5sums=()

_gitroot="git://github.com/gaving/vimmpc.git"
_gitname="vimmpc"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build

  cd ${srcdir}
    # python2 fix
    for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done

  cd $srcdir/$_gitname-build
    install -d ${pkgdir}/usr/share/vim/vimfiles/plugin/
    sed -i 's/function TrackFoldText/function! TrackFoldText/g' $_pkgname.vim
    install -Dm 755 $_pkgname.{vim,py} ${pkgdir}/usr/share/vim/vimfiles/plugin/
}
