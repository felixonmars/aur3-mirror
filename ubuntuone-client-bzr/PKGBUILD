# package by: Samir Faci <csgeek@archlinux dot us > 

pkgname=ubuntuone-client-bzr
pkgver=74
pkgrel=1
pkgdesc="Client for Ubuntu One shareing service, this is a first attempt, expect bugs..but it does build."
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntuone-client"
license=('GPL3')
groups=('ubuntuone-bzr')
depends=('dbus-python' 'gnome-python-desktop' 'gnome-settings-daemon' 'libproxy' \
'pyinotify' 'python' 'python-configglue' 'python-notify' 'python-simplejson' \
'ubuntuone-storage-protocol>=1.5.1' 'ubuntu-sso-client>=0.99.4' 'xdg-utils' 'gnome-common' )
makedepends=('bzr' 'intltool' 'nautilus' 'xorg-utils' 'imake' 'automake' 'gtk-doc' )
provides=('ubuntuone-client-bzr')
conflicts=('ubuntuone-client')
options=(!emptydirs)

_bzrbranch=lp:ubuntuone-client
_bzrseries=trunk

build() {

  cd ${srcdir}
  msg "Connecting to the server...."
  if [ ! -d ./${_bzrseries} ]; then
    bzr co ${_bzrbranch} ${_bzrseries}
  else
    cd ${_bzrseries}
    bzr up ${_bzrseries}
  fi
  cd ${srcdir}

  msg "BZR checkout done or server timeout"
  [ -d ${_bzrseries}-build ] && rm -rf ${_bzrseries}-build
  msg "Creating build copy"
  bzr co ${_bzrseries} ${_bzrseries}-build
  cd ${_bzrseries}-build

  # Start install
  patch -p1 -i ../../py2.patch
  ./autogen.sh  --prefix=/usr --sysconfdir=/etc --localstatedir=/var ac_cv_path_PYTHON=/usr/bin/python2
  make
  make DESTDIR=$pkgdir install

}
