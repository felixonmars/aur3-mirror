# Maintainer: Yannick Schaefer <m00n(at)chillaz-net.de>
pkgname=mutc
pkgver=0.1
pkgrel=0
pkgdesc="A twitter client using pyqt & qml"
arch=('i686' 'x86_64')
url="http://www.github.com/m00n/mutc"
license=('GPL')
makedepends=('git')
depends=('python2-qt' 'python2-tweepy-git' 'python2-logbook' 'python2-path')

_gitroot="git://github.com/m00n/mutc.git"
_gitname="mutc"

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

  cd $_gitname

  python2 setup.py build
  python2 setup.py install --root=$pkgdir
}


