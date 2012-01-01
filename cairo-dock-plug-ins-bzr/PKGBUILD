# Contributor: Shanto
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cairo-dock-plug-ins-bzrc
pkgver=2242
pkgrel=1
pkgdesc="All official plugins for cairo-dock from the development branch"
url="http://www.glx-dock.org/"
license=('GPL')
arch=('i686' 'x86_64')
groups=('lh')
depends=('cairo-dock-bzr>957' 'libpulse' 'libetpan' 'fftw' 'libexif' 'upower' 'lm_sensors' 'libwebkit3')
makedepends=('bzr' 'intltool' 'perlxml' 'libxxf86vm' 'vte' 'cmake')
conflicts=('cairo-dock-plug-ins')
provides=('cairo-dock-plug-ins')
source=()
md5sums=()

_bzrmod=cairo-dock-plug-ins
_bzrtrunk=http://bazaar.launchpad.net/~cairo-dock-team/cairo-dock-plug-ins/plug-ins/

build() {
  cd $srcdir/
  
  msg "Connecting to the server...."
  
  if [ ! -d ./${_bzrmod} ]; then
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
  fi
  
  msg "bzr checkout done or server timeout"
  
  msg "Removing old build directory..."
  [ -d $srcdir/$_bzrmod-build ] && rm -rf $srcdir/$_bzrmod-build
  msg "Creating build directory..."
  cp -r $srcdir/$_bzrmod $srcdir/$_bzrmod-build
  
  msg "Starting make..."
  cd $srcdir/$_bzrmod-build
  
  sed -i 's+PYTHON_EXECUTABLE python+PYTHON_EXECUTABLE python2+' CMakeLists.txt
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DROOT_PREFIX=$pkgdir \
    -Denable-network-monitor=yes \
    -Denable-disks=yes \
    -Denable-old-gnome-integration=yes \
    -Denable-doncky=yes \
    -Denable-scooby-do=yes 
  
  make
}

package() {
  cd $srcdir/$_bzrmod-build
  make install DESTDIR=$pkgdir
}
