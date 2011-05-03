pkgname=unity-place-files-bzr
pkgver=171
pkgrel=1
pkgdesc="A daemon exposing your files and file history to Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-place-files"
license=('GPL')
depends=('glib2-ubuntu' 'zeitgeist' 'libunity-bzr')
makedepends=('vala' 'bzr')
provides=('unity-place-files')
conflicts=('unity-place-files')
groups=('unity2d-bzr')

_bzrtrunk=lp:unity-place-files
_bzrmod=unity-place-files

build() {
cd ${srcdir}
  msg "Connecting to the server...."

  if [ -d ${_bzrmod} ]; then
    bzr up ${_bzrmod}
    msg "The local files are updated."
  else
    bzr co ${_bzrtrunk} ${_bzrmod}
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  if [[ -d ${srcdir}/build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/build 
  fi
  bzr clone ${srcdir}/${_bzrmod} ${srcdir}/build
  cd ${srcdir}/build
  ./autogen.sh  --prefix=/usr
  make 
}

package() { 
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
