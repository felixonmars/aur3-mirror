# Maintainer:  Bernardo Barros <bernardobarros@gmail.com>
# Contributor: Björn Lindig <bjoern.lindig@googlemail.com>

pkgname=supercollider-3.5-git
pkgver=20120612
pkgrel=1
pkgdesc="An environment and programming language for real time audio synthesis and algorithmic composition."
url="http://supercollider.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('jack' 'fftw' 'avahi' 'ruby' 'icu' 'cwiid' 'rsync' 'qtwebkit')
makedepends=('git' 'libsndfile>=1.0' 'emacs' 'vim' 'gedit' 'pkgconfig>=0.14.0' 'cmake' 'alsa-lib' 
'boost')
optdepends=('sc3-plugins-git: extra audio UGens'
            'swingosc: java based GUI system')
conflicts=('supercollider')
provides=('supercollider=3.5')

install=sc3.install

# Official git repo:0
_gitroot="git://github.com/supercollider/supercollider.git"
_gitname="supercollider"

build() {

  export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

  cd $srcdir
  msg "Connecting to GIT server...."

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
  git checkout -t origin/3.5
  git submodule init && git submodule update
  cd ..

  cp -r $_gitname $_gitname-build
  cd $_gitname-build/

  mkdir build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DSC_WII=1 -DSUPERNOVA=1 -DSC_QT=1 -DNATIVE=1 

  #cmake-gui ..

  make
}

package() {

  cd $srcdir/$_gitname-build/build

  make DESTDIR=$pkgdir/ install
}

