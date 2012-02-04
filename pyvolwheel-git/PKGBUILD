# Contributor: epinull <epinull at gmail dot com>

pkgname=pyvolwheel-git
pkgver=20101024
pkgrel=1
pkgdesc="Volume control tray icon"
arch=('any')
url="http://github.com/epinull/pyvolwheel"
license=('GPL3')
depends=('python2>=2.6' 'pygtk>=2.16')
optdepends=('python-pyalsaaudio: ALSA support'
            'python-xlib: global hotkeys')
makedepends=('git')
conflicts=('pyvolwheel')
provides=('pyvolwheel')
source=()
md5sums=()

_gitroot="git://github.com/epinull/pyvolwheel.git"
_gitname="pyvolwheel"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  sed -i 's/env python$/env python2/' bin/pyvolwheel || return 1
  python2 setup.py install --root="$pkgdir/" --optimize=1 || return 1
}

