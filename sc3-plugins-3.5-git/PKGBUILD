# Maintainer: Bernardo Barros <bbarros@xsounds.org>

pkgname=sc3-plugins-3.5-git
pkgver=20120507
pkgrel=1
pkgdesc="Plugins for SuperCollider (git version against 3.5 branch)"
url="http://supercollider.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('supercollider>=3.5' 'supercollider<3.6')
conflicts=('supercollider-with-extras-git' 'sc3-plugins-git' 'sc3-plugins')
provides=('sc3-plugins')

# SC3-plugins:
_gitroot="git://sc3-plugins.git.sourceforge.net/gitroot/sc3-plugins/sc3-plugins"
_gitname="sc3-plugins"


build() {

  if [ -d $_gitname ] ; then
    (cd $_gitname && git pull origin && git submodule update)
    msg "The local files are updated."
  else
    git clone --recursive $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build

  cd $_gitname
  git submodule init && git submodule update
  cd ..

  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DSC_PATH=$HOME/src/supercollider -DSUPERNOVA=1 -DAY=1 
  make
}

package() {

  cd $_gitname-build

  make DESTDIR=$pkgdir/ install
}

