# Maintainer: Gordin <9ordin @t gmail d@t com>
pkgname=wiican-bzr
pkgver=198
pkgrel=2
pkgdesc="A system tray gui for wminput"
arch=('i686' 'x86_64')
url="http://launchpad.net/wiican"
license=('GPL3')
depends=('shared-mime-info' 'hicolor-icon-theme' 'cwiid' 'python2-ply' 'pygtk' 'dbus-python' 'python2-yaml' 'libappindicator')
makedepends=('bzr')
provides=('wiican')
conflicts=('wiican')
install=wiican-bzr.install

_bzrtrunk=lp:wiican
_bzrmod=wiican

build() {
  cd "$srcdir"

  msg "Connecting to wiican bzr server...."

  if [ ! -d $srcdir/$_bzrmod ] ; then
    bzr branch ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    bzr up ${_bzrmod}
  fi

  msg "bzr checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_bzrmod-build
  cp -r $srcdir/$_bzrmod $srcdir/$_bzrmod-build
  cd $srcdir/$_bzrmod-build

  python2 setup.py install --root=${pkgdir} || return 1
} 
