# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=oomidi
pkgname=$_name-git
pkgver=20120303
pkgrel=1
pkgdesc="Open Octave Midi, the open source MIDI/Audio sequencer."
arch=(i686 x86_64)
url="http://www.openoctave.org/"
license=('GPL')
depends=('qt' 'gtk2' 'jack' 'liblscp-svn' 'linuxsampler-svn' 'python2-pyro')
makedepends=('git' 'cmake' 'lash' 'liblo')
optdepends=('lash: session support'
            'sonatina-symphony-orchestra: orchestral library')
provides=("$_name")
conflicts=("$_name" "oom")
install="$pkgname.install"

_gitroot=git://git.openoctave.org/oom.git
_gitname=$_name

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

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

  #
  # BUILD HERE
  #

  # prepare build folder
  mkdir build && cd build

  cmake .. -DCMAKE_BUILD_TYPE=release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DENABLE_LSCP=ON \
           -DENABLE_LV2=ON \
           -DENABLE_LILV_STATIC=ON \
           -DENABLE_LV2UI=ON
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"

  make DESTDIR="$pkgdir/" install

  # python2 fixes
  sed -i "s/^\#\!.*python/&2/" \
     `grep -rl "^\#\!.*python" "$pkgdir"`
} 
