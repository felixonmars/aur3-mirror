pkgname=unity-place-applications-bzr
pkgver=209
pkgrel=1
pkgdesc="A daemon that exposes you applications with their usage statistics and status to Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-place-applications"
license=('GPL')
depends=('glib2-ubuntu' 'libzeitgeist' 'libunity-bzr' 'gnome-menus' 'xapian-core')
makedepends=('vala' 'bzr')
provides=('unity-place-applications')
conflicts=('unity-place-applications')
groups=('unity2d-bzr')

_bzrtrunk=lp:unity-place-applications
_bzrmod=unity-place-applications

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
  ./autogen.sh  --prefix=/usr --sysconfdir=/etc
  make 
}

package() { 
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
