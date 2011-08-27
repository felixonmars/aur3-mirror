# Contributor: twa022 <twa022 at gmail dot com>

pkgname=screenlets-framework-bzr
_realname=screenlets
pkgver=688
pkgrel=1
pkgdesc="Framework for running screenlets (daemon & manager)"
arch=('i686' 'x86_64')
url="https://launchpad.net/~screenlets-dev"
license=('GPL')
depends=('dbus-python' 'python2-gconf' 'python-gnomekeyring' 
         'python2-gnomevfs' 'python-rsvg' 'python-wnck' 'pyxdg' 
         'notification-daemon' 'xdg-utils')
makedepends=('bzr' 'python2-distribute')
provides=($_realname=0.1.3)
conflicts=($_realname)

_bzrtrunk=https://code.launchpad.net/~screenlets-dev/screenlets/trunk
_bzrmod=$pkgname

build() {
  cd $srcdir
  msg "Connecting to the server...."
  if [ ! -d ./$_bzrmod ]; then
    bzr co $_bzrtrunk $_bzrmod -r $pkgver
  else
    bzr up $_bzrmod
  fi
  msg "BZR checkout done or server timeout"
  msg "Starting make..."
  [ -d ./$_bzrmod-build ] && rm -rf ./$_bzrmod-build
  cp -r ./$_bzrmod ./$_bzrmod-build
  cd ./$_bzrmod-build
  
  python2 setup.py install --root=$pkgdir
  for _file in $( find ${pkgdir} -type f ) ; do 
    sed -i 's:python\([^2]\):python2\1:g' ${_file}
    sed -i 's:python$:python2:' ${_file}
  done
  mkdir -p ${pkgdir}/usr/share/pixmaps
  ln -s /usr/share/icons/hicolor/scalable/apps/screenlets-tray.svg ${pkgdir}/usr/share/pixmaps/screenlets-tray.svg
  ln -s /usr/share/icons/hicolor/scalable/apps/screenlets.svg ${pkgdir}/usr/share/pixmaps/screenlets.svg
}

