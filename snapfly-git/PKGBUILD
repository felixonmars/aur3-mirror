# Maintainer: Ilya Medvedev <medved55rus [at] gmail [dot] com>

pkgname=snapfly-git
pkgver=20130126
pkgrel=1
pkgdesc="Lightweight GTK+ menu written in python"
arch=('any')
url="https://github.com/drakmail/snapfly"
license=('GPL3')
depends=('pygtk' 'python2-pyinotify' 'dbus-python')
provides=('snapfly')
conflicts=('snapfly')
source=()
md5sums=()
_gitroot="git://github.com/drakmail/snapfly.git"
_gitname="snapfly"

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

  cd "${srcdir}/$_gitname/"

  # Use Python 2
  sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' src/launcher.py
  
  python2 setup.py install --root=${pkgdir}
}
