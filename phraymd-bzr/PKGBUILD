# Contributor: skualito <lepascalouAT@gmailDOT.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=phraymd-bzr
pkgver=0.4.0
pkgrel=1
pkgdesc="phraymd is a free and open source photo collection manager designed for Linux and the gnome desktop."
arch=('i686' 'x86_64')
url="https://launchpad.net/phraymd"
license=('GPL3')
depends=('python-imaging' 'dcraw' 'gnome-python' 'dbus-python' 'pyexiv2' 'python2-pyinotify' 'python2-flickrapi')
makedepends=('bzr')
optdepends=('python-osmgpsmap')

_bzrbranch=lp:phraymd
_bzrname=phraymd

build() {
  cd ${srcdir}
  msg "Connecting to BZR server..."

  if [ -d ${srcdir}/${_bzrname} ] ; then
    cd ${_bzrname} && bzr pull ${_bzrbranch}
    msg "Local repository updated."
  else
    bzr co ${_bzrbranch}
  fi
  #bzr branch ${_bzrbranch} -q -r ${pkgver}
  cd ${srcdir}
  msg "BZR checkout done or server timeout"  
}

package() {
  cd $srcdir/phraymd
  python2 setup.py install --prefix=/usr --install-purelib=/usr/share/phraymd --root=$pkgdir || return 1
}
