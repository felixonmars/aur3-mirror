# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.MaRS <leemars at gmail dot com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: TigerSoldier <tigersoldier@archlinux>

pkgname=ibus-anthy-git
pkgver=20110721
pkgrel=1
pkgdesc="Japanese input method Anthy IMEngine for IBus Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('ibus' 'anthy' 'python2')
makedepends=('swig' 'intltool')
optdepends=('kasumi: manage directories')
options=('!libtool')
conflicts=('ibus-anthy')
source=()
md5sums=()

_gitroot="git://github.com/fujiwarat/ibus-anthy.git"
_gitname="ibus-anthy"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  cp -rf $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

# python2 fix
  for file in setup/ibus-setup-anthy.in engine/ibus-engine-anthy.in; do
    sed -i 's_exec python_exec python2_' $file
  done

  ./autogen.sh --prefix=/usr --libexec=/usr/lib/ibus PYTHON=/usr/bin/python2
  make
}

package() {
  cd "${srcdir}/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}
