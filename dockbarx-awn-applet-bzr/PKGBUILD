# Contributor: twa022 <twa022 at gmail dot com>

pkgname=dockbarx-awn-applet-bzr
_pkgname=dockbarx
pkgver=352
pkgrel=1
pkgdesc="GNOME TaskBar with groupping and group manipulation. (AWN applet)"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~dockbar-main/dockbar/experimental"
license=('GPL3')
depends=('avant-window-navigator' 'dockmanager-bzr' 'dockbarx-bzr')
makedepends=('bzr')
conflicts=('dockbarx-awn-applet')
provides=('dockbarx-awn-applet')
source=()
	
_bzrmod=$_pkgname
_bzrtrunk=https://code.launchpad.net/~dockbar-main/dockbar/experimental

build() {
  cd $startdir/src
  msg "Connecting to the server...."

  if [ -d ./$_bzrmod ]; then
    cd ./$_bzrmod && bzr up && cd ..
  else
    bzr co $_bzrtrunk $_bzrmod
  fi

  [ -d ./$_bzrmod-build ] && rm -fr ./$_bzrmod-build
  cp -r ./$_bzrmod ./$_bzrmod-build
  cd ./$_bzrmod-build

  cd ${srcdir}/${_pkgname}-build

  mkdir -p ${pkgdir}/usr/share/avant-window-navigator/applets
  cp -r AWN/* ${pkgdir}/usr/share/avant-window-navigator/applets

  sed -i 's:/usr/bin/python:&2:' ${pkgdir}/usr/share/avant-window-navigator/applets/DockBarX/DockBarX.py
}

