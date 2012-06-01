# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

_appname=mplayer.py
pkgname=python2-"${_appname}"-git
pkgver=20120601
pkgrel=1
pkgdesc="Lightweight and dynamic MPlayer wrapper with a Pythonic API"
arch=('any')
url="http://code.google.com/p/python-mplayer/"
license=('LGPL')
depends=('mplayer' 'python2')
makedepends=('git' 'python2-distribute')
provides=("python2-mplayer.py")
conflicts=("python2-mplayer.py")
optdepends=('python2-pyqt: for Qt integation'
            'pygtk: for GTK integration')

_gitroot="https://github.com/baudm/mplayer.py.git"
_gitname="mplayer.py"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"

  python2 setup.py install -O1 --root="${pkgdir}"
}

